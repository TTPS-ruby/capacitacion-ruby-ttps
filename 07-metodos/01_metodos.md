!SLIDE center transition=uncover
# Un poco más sobre métodos

!SLIDE smbullets small transition=uncover
# Definiendo un método
* Los nombres de los métodos deben empezar con minúscula o underescore
  * *No es error que el nombre comience con mayúsucla, el problema es que en la
    invocación, Ruby tratará de interpretarlo como una constante, y por tanto
    parsear la llamada en forma incorrecta. Por convención, los métodos que
    comienzan con mayúsucla se utilizan para conversiones de tipos*
* Cuando retornamos un boolean, es prolijo que el método termine con `?`
* Aquellos métodos *peligrosos* deben terminar con `!`
* Los métodos que aparecen a la izquierda de una asignación terminan con `=`

!SLIDE smbullets small transition=uncover
# Argumentos
* Los parámtros a un método se escriben como una lista de variables entre
  paréntesis
  * *Los paréntesis pueden omitirse; por convensión se usarán paréntesis cuando
    el método tenga argumentos, y omitirlos cuando no*
* Es posible definir valores por defecto para los argumentos
  * *Incluso usando como valor un parámetro anterior*

## Ejemplos
	@@@ ruby
	def concat(a="a", b="b")
		"#{a},#{b}"
	end

	def surround(word, pad_width=word.length/2)
	"[" * pad_width + word + "]" * pad_width
	end

!SLIDE smbullets transition=uncover
# Argumentos variables
* Usando un `*` antes del nombre del argumento, luego de los parámetros normales logramos este efecto
	* A partir de Ruby 1.9, es posible definir el argumento variable en cualquier
	  posición. Lo importante es no tener más de uno
* A esta técnica se la suele llamar: *splatting an argument* 

## Ejemplo
	@@@ ruby
	def varargs(arg1, *rest)
		"arg1=#{arg1}. rest=#{rest.inspect}"
	end

!SLIDE smbullets smaller transition=uncover
# Usos de splat
* Es común que se utilice splat en una subclase para pasar los parámetros a la
	superclase usando `super`
	* Si no se especifican parámetros a `super`, entonces se invoca el método del
	  padre con todos los argumentos que se hayan recibido

## Ejemplo

	@@@ ruby
	class Child < Parent
		def do_something(*not_used)
			# our processing
			super
		end
	end

## O en forma similar

	@@@ ruby
	class Child < Parent
		def do_something(*)
			# our processing
			super
		end
	end


!SLIDE bullets transition=uncover
# Retornando valores 
* Los métodos siempre retornan un valor aunque el mismo no sea utilizado
* Podemos usar `return` para forzar la salida
	* Si se envían varios parámetros a `return` se retorna un arreglo
	* El caso anterior se puede usar en asignaciones en paralelo

!SLIDE bullets small transition=uncover
# Expandiendo collecciones en llamadas a métodos
* Es la idea inversa a la explicación de splat previa

## Ejemplo

	@@@ ruby
	def five(a, b, c, d, e)
		"I was passed #{a} #{b} #{c} #{d} #{e}"
	end

	five(1, 2, 3, 4, 5 )
	five(1, 2, 3, *['a', 'b'])
	five(*['a', 'b'], 1, 2, 3)
	five(*(10..14))
	five(*[1,2], 3, *(4..5))

!SLIDE bullets small transition=uncover
# Haciendo más dinámicos los bloques
* Al igual que en el caso anterior de splat, podemos necesitar especificar que
	uno de los parámetros a un método es un bloque

## En vez de 
	@@@ ruby
	(1..10).collect { |x| x*2}.join(',')

## Podemos usar
	@@@ ruby
	b = -> x { x*2}
	(1..10).collect(&b).join ','

!SLIDE bullets smaller transition=uncover
# Argumentos como Hash
* Hasta Ruby 1.9 no existía la posibilidad de usar *keyword arguments* 
	* En vez de especificar los parámetros en el orden en que se definieron, es posible
  especificar qué valor tomará cada parámetro indicando el hecho con el nombre
  del argumento y su valor
* Hasta que Ruby 1.9 se utilizaba Hash en su reemplazo para obtener el mismo
  resultado

## Ejemplo con Hash
	@@@ ruby
	class SongList
		def search(name, params)
		# ...
		end
	end
	list.search(:titles,
	            { :genre              => "jazz",
	              :duration_less_than => 270
	            })

!SLIDE smbullets smaller transition=uncover
# Argumentos como Hash
* En el ejemplo anterior el primer parámetro indica qué atributo retornar
	mientras que el segundo es un hash con el criterio de búsqueda
* Lo incómodo del ejemplo es la necesidad de usar `{}`, además de la posible
	confusión con la posibilidad de que se esté indicando un bloque
* Ruby ofrece una solución: puede usarse `clave => valor` en la lista de
	argumentos siempre que:
	* Sea luego de los argumentos *normales*
	* Antes de un splat y bloque
	* Ya no es necesario usar llaves

## Ejemplo
	@@@ ruby
	# Ruby <= 1.9
	list.search(:titles,
	            :genre              => 'jazz',
	            :duration_less_than => 270)

	# Ruby >= 1.9
	list.search(:titles, genre: 'jazz', duration_less_than: 270)

!SLIDE small transition=uncover
# Keyword aruments: solo Ruby 2.0
## Asumimos un supuesto método `log`
	@@@ ruby
	def log(msg, level: "ERROR", time: Time.now)
		puts "#{ time.ctime } [#{ level }] #{ msg }"
	end
## En Ruby 1.9 teníamos que:
	@@@ ruby
	def log(msg, opt = {})
		level = opt[:level] || "ERROR"
		time  = opt[:time]  || Time.now
		puts "#{ time.ctime } [#{ level }] #{ msg }"
	end
	log("Hello!", level: "INFO")

!SLIDE bullets smaller transition=uncover
# Keyword aruments: solo Ruby 2.0
* Las cosas parecen simples, pero todo se complica un poco si sucede:
	* Queremos usar keyword arguments con splat
	* Lanzar excepciones cuando un argumento no es conocido

## Caeríamos en:
	@@@ ruby
	def log(*msgs)
		opt = msgs.last.is_a?(Hash) ? msgs.pop : {}
		level = opt.key?(:level) ? opt.delete(:level) : "ERROR"
		time  = opt.key?(:time ) ? opt.delete(:time ) : Time.now
		raise "unknown keyword: #{ opt.keys.first }" if !opt.empty?
		msgs.each {|msg| puts "#{ time.ctime } [#{ level }] #{ msg }" }
	end

*Pero nos gustó preservar la primer versión del ejemplo*

!SLIDE bullets smaller transition=uncover
# Keyword aruments: solo Ruby 2.0
## Probamos los argumentos
	@@@ ruby
	log("Hello")
	log("Hello!", level: "ERROR", time: Time.now)
## Y si cambiamos el orden
	@@@ ruby
	log("Hello!", time: Time.now, level: "ERROR") 
	log(level: "ERROR", time: Time.now, "Hello!")
## Cuando enviamos un argumento no conocido
	@@@ ruby
	log("Hello!", date: Time.new) 

!SLIDE bullets smaller transition=uncover
# Keyword aruments: solo Ruby 2.0
* Si queremos evitar las excepciones 
	* Podemos usar `**` para explícitamente agrupar el resto de los keyword
	  arguments en un hash (como splat)

## Veamos como quedaría
	@@@ ruby
	def log(msg, level: "ERROR", time: Time.now, **kwrest)
	  puts "#{ time.ctime } [#{ level }] #{ msg }"
	end
	
	log("Hello!", date: Time.now) 
	
!SLIDE bullets smaller transition=uncover
# Keyword aruments: solo Ruby 2.0
## Todos los casos
	@@@ ruby
	def f(a, b, c, m = 1, n = 1, *rest, x, y, z, k: 1, 
	      **kwrest, &blk)
		puts "a: %p" % a
		puts "b: %p" % b
		puts "c: %p" % c
		puts "m: %p" % m
		puts "n: %p" % n
		puts "rest: [%p]" % rest.join(',')
		puts "x: %p" % x
		puts "y: %p" % y
		puts "z: %p" % z
		puts "k: %p" % k
		puts "kwrest: %p" % kwrest
		puts "blk: %p" % blk
	end

	f("a", "b", "c", 2, 3, "foo", "bar", "baz", "x", 
	  "y", "z", k: 42, u: "unknown") { }

