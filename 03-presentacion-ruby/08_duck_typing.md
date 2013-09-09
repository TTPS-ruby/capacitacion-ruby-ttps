!SLIDE center transition=uncover
# Duck typing
!SLIDE smbullets transition=uncover
# ¿Qué es duck typing?
* Es un término empleado en **OO**
* Estilo de tipeo dinámico donde:
  * Los métodos y propiedades determinan la semántica válida
  * En vez de utilizar herencia o interfaces para indicar la propiedad: **es un
    ..**
* El nombre del concepto se refiere al *duck test*, atribuído a James Whitcomb
  Riley que podría resumirse en:

*Si veo un pájaro que camina como pato, nada como pato y hace "cuack" como pato,
entonces llamaré a ese pájaro un pato*

!SLIDE smbullets transition=uncover
# En Java: versión simple
	@@@ java
	public interface DuckLike {
		Cuack cuack();
	}
	//...
	public void doSomething(DuckLike d) {
		d.cuack();
	//  ...
	}


!SLIDE smaller transition=uncover
# En Java: usando reflexión

	@@@ java
	import java.lang.reflect.InvocationHandler;
	import java.lang.reflect.InvocationTargetException;
	import java.lang.reflect.Method;
	import java.lang.reflect.Proxy;
	 
	public class DuckTyping {
	 
		interface Walkable  { void walk(); }
		interface Swimmable { void swim(); }
		interface Quackable { void quack(); }
 
		public static void main(String[] args) {
			Duck d = new Duck();
			Person p = new Person();

			as(Walkable.class, d).walk();   //duck can walk()
			as(Swimmable.class, d).swim();  //duck can swim() 
			as(Quackable.class, d).quack(); //duck can quack()

			as(Walkable.class, p).walk();   //person can walk()
			as(Swimmable.class, p).swim();  //person can swim() 
			// Gives Runtime Error
			as(Quackable.class, p).quack(); //person can't quack()
		}
	//...

!SLIDE smaller transition=uncover
# En Java: usando reflexión (cont)
	@@@ java
		@SuppressWarnings("unchecked")
		static <T> T as(Class<T> t, final Object obj) {
			return (T) Proxy.newProxyInstance(t.getClassLoader(), 
				new Class[] {t},
				new InvocationHandler() {
					public Object invoke(Object proxy, 
								Method method, 
								Object[] args) throws Throwable {
						try {
							return obj.getClass()
							  .getMethod(method.getName(), 
							     method.getParameterTypes())
							  .invoke(obj, args);
						} catch (NoSuchMethodException nsme) {
							throw new NoSuchMethodError(
							  nsme.getMessage());
						} catch (InvocationTargetException ite) {
							throw ite.getTargetException();
						}
					}
				});
		}
	}
	//....

!SLIDE smaller transition=uncover
# En Java: usando reflexión (cont)
	@@@ java
	class Duck {
		public void walk()  {
			System.out.println("I'm Duck, I can walk...");
		}
		public void swim()  {
			System.out.println("I'm Duck, I can swim...");
		}
		public void quack() {
			System.out.println("I'm Duck, I can quack...");
		}
	}
	 
	class Person {
		public void walk()  {
			System.out.println("I'm Person, I can walk...");
		}
		public void swim()  {
			System.out.println("I'm Person, I can swim...");
		}
		public void talk()  {
			System.out.println("I'm Person, I can talk...");
		}
	}

!SLIDE smaller transition=uncover
# En Ruby
	@@@ ruby
	class Duck
		def quack
			puts "Quaaaaaack!"
		end
		def feathers
			puts "The duck has white and gray feathers."
		end
	end
	class Person
		def quack
			puts "The person imitates a duck."
		end
		def feathers
			puts "The person takes a feather from the ground"
		end
	end
	def in_the_forest duck
		duck.quack
		duck.feathers
	end
	 
	donald = Duck.new
	john = Person.new
	in_the_forest donald
	in_the_forest john
