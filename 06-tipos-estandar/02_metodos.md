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
