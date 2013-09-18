!SLIDE center transition=uncover
# Contenedores, bloques e iteradores

!SLIDE smbullets transition=uncover
# Introducción
* Las colecciones representan elementos fundamentales de cualquier programa
* Ruby provee dos clases que representan colecciones: 
  * `array`
  * `hash` o  arreglo asociativo
* El correcto uso de estas colecciones es fundamental en la programación Ruby
* Los bloques, combinados con colecciones se convierten en construcciones muy
  poderosas para la iteración

!SLIDE smbullets small transition=uncover
# Array
* La clase `Array` mantiene una colección de referencias a objetos. 
* Cada referencia a objeto ocupa una posición en el arreglo, identificada por un
  índice entero no negativo

## Ejemplos de array
	@@@ ruby
	a = [ 3.14159, "pie", 99 ]
	a.class
	a.length
	a[0]
	a[1]
	a[2]
	a[3]
	
	b = Array.new
	b.class
	b.length
	b[0] = "second"
	b[1] = "array"
	b

!SLIDE smbullets small transition=uncover
# Arrays y `[]`
* Los elementos de un arreglo se acceden con el operador `[]`
* Pero `[]` es un método (de instancia en la clase `Array`) y por tanto puede
  implementarse por cualquier subclase
* El primer índice de un arreglo es el cero
* Un arreglo accedido en un índice positivo retorna el objeto referenciado en
  esa posición.
  * Si no hay objeto, retorna `nil`
* Un arreglo accedido en un índice negativo, retorna el objeto contando desde el
  final

## Indices negativos

	@@@ ruby
	a = [ 1, 7, 9]
	a[-1]
	a[-2]
	a[-99]

!SLIDE smbullets smaller transition=uncover
# Arrays y `[]`
## Indexando con un par de valores
	@@@ ruby
	a = [ 1, 3, 5, 7, 9 ]
	a[1, 3]
	a[3, 1]
	a[-3, 2]

*Acceder arrays con dos valores indica `[start,count]` y retorna siempre un
nuevo `array`*

## Pueden usarse rangos

	@@@ ruby
	a = [ 1, 3, 5, 7, 9]
	a[1..3]
	a[1...3]
	a[3..3]
	a[-3..-1]

* El rango indica los ínidces **desde** y **hasta**
* Usando `..` se incluye el fin de rango
* Usando `...` se **excluye** el extremo final

!SLIDE smbullets transition=uncover
# Arrays y `[]=`
* El método `[]=` permite setear elementos de un array
* Si se utiliza con un único índice, entonces reemplaza su valor por lo que esté
  a la derecha de la asignación
  * Cualquier gap que haya quedado luego de `[]=` se completa con nil

## Un ejemplo

	@@@ ruby
	a = [ 1, 3, 5, 7, 9 ]
	a[1] = 'bat'
	a[-3] = 'cat'
	a[3] = [ 9, 8 ]
	a[6] = 99

!SLIDE smbullets small transition=uncover
# Arrays y `[]=`
* Si se utiliza con dos valores (inicio, cantidad) o un rango, luego estos
  elementos son reemplazados por lo que esté a la derecha de la asignación
  * Si la cantidad de elementos a reemplazar es cero, entonces el valor 
    es insertado en el array antes de la posición inicial: **no se eliminan 
    elementos**
  * Si el valor a la **derecha es un arreglo**, sus elementos se utilizan en el 
    reemplazo: el tamaño del arreglo destino es actualizado si la cantidad de
    elementos a la derecha difiere de los elementos a reemplazar

## Ejemplo clarificador
	@@@ ruby
	a = [ 1, 3, 5, 7, 9 ]
	a[2, 2] = 'cat'
	a[2, 0] = 'dog'
	a[1, 1] = [ 9, 8, 7 ]
	a[0..3] = []
	a[5..6] = 99, 98

!SLIDE bullets transition=uncover
# Arrays usados como pilas
* Podomos invocar los siguientes métodos de `Array`
  * `push`
  * `pop`

## La Pila

	@@@ ruby
	stack = []
	stack.push "red"
	stack.push "green"
	stack.push "blue"
	p stack
	puts stack.pop
	puts stack.pop
	puts stack.pop
	p stack

!SLIDE bullets transition=uncover
# Arrays usados como colas
* Podomos invocar los siguientes métodos de `Array`
  * `unshift`
  * `shift`

## La Cola

	@@@ ruby
	queue = []
	queue.push "red"
	queue.push "green"
	puts queue.shift
	puts queue.shift

!SLIDE bullets  transition=uncover
# El principio y el final

	@@@ ruby
	array = [ 1, 2, 3, 4, 5, 6, 7 ]
	p array.first(4)
	p array.last(4)

!SLIDE smbullets small transition=uncover
# Hashes 
* Los arreglos se indexan con enteros, los hashes con objetos
  * Símbolos, strings, expresiones regulares, etc
* Cuando se almacena un valor en un hash, deben proveerse dos objetos:
  * El índice, generalmente llamado *key*
  * La entrada a almacenar en dicho índice, generalmente llamdo *valor*
* El acceso a los valores referenciados por un hash se realiza por medio de los
  *keys*

## Un ejemplo

	@@@ ruby
	h = { 'dog' => 'canine', 'cat' => 'feline' }
	h.length # => 3
	h['dog'] # => "canine"
	h['cow'] = 'bovine'
	h[12] = 'dodecine'
	h['cat'] = 99

!SLIDE bullets small transition=uncover
# Acceso a los hashes 
* En el ejemplo anterior se utilizan strings como claves

## Ejemplo con símbolos

	@@@ ruby 
	# En ruby >= 1.9
	h = { dog: 'canine', cat: 'feline' }
	
	# En ruby < 1.9
	h = { :dog => 'canine', :cat => 'feline' }
	

* Comparado a los arreglos, los hashes tienen una ventaja: se indexan con
	objetos
* A partir de la versión 1.9 además se recuerda el órden en que fueron
	insertados los elementos
	* Cuando se itera sobre las entradas de un hash se respeta el orden de
	  inserción

!SLIDE center transition=uncover
# Un ejemplo usando Array y Hash

!SLIDE smbullets transition=uncover
# Frecuencia de palabras

*Calcular el número de veces que aparece una palabra en un texto*

* El problema se divide en dos partes:
	* Separar el texto en palabras: *suena como un array*
	* Luego contar cada palabra diferente: *suena como hash*

!SLIDE transition=uncover
# La solución
## El método que obtiene las palabras

	@@@ ruby
	def words_from_string(string)
		string.downcase.scan(/[\w']+/)
	end

!SLIDE smbullets small transition=uncover
# La solución
## El método que cuenta las palabras

* Usaremos un hash, indexado por las palabras a contar
* El valor será la cantidad de ocurrencias 
	* Tendremos que incializar la primer ocurrencia en el valor 1 para luego sumar

## La primer idea...

*Asumimos que counts es un `Hash`*

	@@@ ruby
	if counts.has_key?(next_word)
		counts[next_word] += 1
	else
		counts[next_word] = 1
	end

!SLIDE bullets small transition=uncover
# La solución

* Podemos ordenar un poco la idea anterior
	* `Hash.new` puede recibir como parámetro el valor usado para incializar cada
	  valor del Hash. *(por ejemplo cuando se accede a un valor que no existe aún en
		el Hash)*

## La misma idea más ordenada

	@@@ ruby
	def count_frequency(word_list)
		counts = Hash.new(0)
		for word in word_list
			counts[word] += 1
		end
		counts
	end

Ver el ejemplo completo en la carpeta `samples/05/words_frequency`

!SLIDE smbullets small transition=uncover
# Testeando nuestra solución
* Aplicar un test rápido es una buena práctica.
* Si bien lo veremos más adelante, vamos introduciendo el concepto
* Utilizaremos un framework de test llamado `Test::Unit` que ya incluye ruby como
  parte de la librería estándar
* Sólo explicaremos el método `assert_equal` que chequea si los dos parámetros 
  que se le envían son iguales, indicando **fuertemente** si así no
  sucede
* Utilizaremos **afirmaciones** *(en inglés assertions)* para testear los dos
  métodos implementados, uno por vez
  * He aquí la razón por la que se escribieron como métodos separados
  * Tener métodos diferentes permite testearlos en forma aislada

!SLIDE smbullets smaller transition=uncover
# Testeamos `words_from_string`
	@@@ ruby
	require_relative 'words_from_string.rb'
	require 'test/unit'

	class TestWordsFromString < Test::Unit::TestCase
		def test_empty_string
			assert_equal([], words_from_string(""))
			assert_equal([], words_from_string(" "))
		end
		def test_single_word
			assert_equal(["cat"], words_from_string("cat"))
			assert_equal(["cat"], words_from_string(" cat "))
		end
		def test_many_words
			assert_equal(["the", "cat", "sat", "on","the","mat"],
					words_from_string("the cat sat on the mat"))
		end
		def test_ignores_punctuation
			assert_equal(["the", "cat's", "mat"],
					words_from_string("<the!> cat's, -mat...-"))
		end
	end

En esta clase, los métodos que comienzan con **test** serán corridos
por el framework de testing

!SLIDE smbullets smaller transition=uncover
# Testeamos `count_frequency`
	@@@ ruby
	require_relative 'count_frequency.rb'
	require 'test/unit'

	class TestCountFrequency < Test::Unit::TestCase
		def test_empty_list
			assert_equal({}, count_frequency([]))
		end
		def test_single_word
			assert_equal({"cat" => 1}, count_frequency(["cat"]))
		end
		def test_two_different_words
			assert_equal({"cat" => 1, "sat" => 1},
						count_frequency(["cat", "sat"]))
		end
		def test_two_words_with_adjacent_repeat
			assert_equal({"cat" => 2, "sat" => 1},
						count_frequency(["cat", "cat", "sat"]))
		end
		def test_two_words_with_non_adjacent_repeat
			assert_equal({"cat" => 2, "sat" => 1},
						count_frequency(["cat", "sat", "cat"]))
		end
	end

!SLIDE center transition=uncover
# Bloques e iteradores

!SLIDE bullets small transition=uncover
# Introducción

## En `samples/05/words_frequency/top_five` usamos:
	@@@ ruby
	for i in 0...5
		word = top_five[i][0]
		count = top_five[i][1]
		puts "#{word}: #{count}"
	end

En cualquier lenguaje esto es natural

## Mucho más intuitivo es:
	@@@ ruby
	top_five.each do |word, count|
		puts "#{word}: #{count}"
	end

	# o más simple:
	top_five.each { |word, count| "#{word}: #{count}" }

!SLIDE smbullets smaller transition=uncover
# Bloques
* Un bloque es código encerrado entre llaves o las palabras claves `do` y `end`
* Ambas formas son idénticas, salvo por la precedencia 
	* Cuando el código del bloque entra en una línea usar {}
	* Cuando tiene más de una línea usar `do` / `end`
* Los bloques pueden verse como métodos anónimos
* Pueden recibir parámetros, que se explicitan entre barras verticales `|`
* El código de un bloque no se ejecuta cuando se define, sino que se almacenará
	para ser ejecutado más adelante
* En ruby, los bloques sólo podrán usarse después de la *invocación* de algún
	método
	* Si el método recibe parámetros, entonces aparecerá luego de ellos
	* Podría verse incluso como un parámetro extra que es pasado al método

!SLIDE smbullets smaller transition=uncover
# Ejemplo
## Suma de los cuadrados de los números en un arreglo
	@@@ ruby
	sum = 0
	[1, 2, 3, 4].each do |value|
		square = value * value
		sum += square
	end
	puts sum

* El bloque se invoca para cada elemento en el arreglo
* El elemento del arreglo es pasado al bloque en la variable `value`
* La variable `sum` declarada fuera del bloque es actualizada dentro del bloque
	* **Regla importante:** *si existe una variable en el bloque con el mismo
	  nombre que una variable dentro del alcance fuera del bloque, ambas serán la
	  misma. En el ejemplo hay sólo una variable `sum`*
	* Veremos que el comportamiento mencionado podremos cambiarlo
	* Si una variable aparece sólo en el bloque, entonces será local al mismo (como
`square`)

!SLIDE transition=uncover
# Los casos no esperados
	@@@ ruby
	# assume Shape defined elsewhere
	square = Shape.new(sides: 4) 
	#
	# .. lots of code
	#
	sum = 0
	[1, 2, 3, 4].each do |value|
		square = value * value
		sum += square
	end

	puts sum
	square.draw # BOOM!

!SLIDE small transition=uncover
# Mas casos

## No sucede lo mismo con los argumentos al bloque

	@@@ ruby
	value = "some shape"
	[ 1, 2 ].each {|value| puts value }
	puts value

## Podemos solucionar el problema de `square`

	@@@ ruby
	square = "some shape"
	sum = 0
	[1, 2, 3, 4].each do |value; square|
		square = value * value # different variable
		sum += square
	end
	puts sum
	puts square

!SLIDE smbullets smaller transition=uncover
# La magia de los bloques
* Mencionamos que los bloques se utilizan de forma adyacente a la llamada a un
	método y que no se ejecutan en el momento en que aparecen en el código
* Para lograr este comportamiento, dentro de un método cualquiera, podremos
	invocar un bloque
	* Los bloques se invocarán como si fueran métodos
	* Para invocar un bloque se utiliza la sentencia `yield`
	* Al invocar `yield` ruby invocará al código del bloque 
	* Cuando el bloque finaliza, ruby devuelve el código inmediatamente al
	  finalizar el llamado a `yield`

## Un ejemplo
	@@@ ruby
	def three_times
		yield
		yield
		yield
	end
	three_times { puts "Hola" }

!SLIDE bullets transition=uncover
# Parámetros a un bloque
* Cuando utilizamos yield podemos enviarle un parámetro
  * El parámetro enviado se mapea con el definido en el bloque entre las barras
    verticales
* Un bloque puede retornar un valor y ser usado en el método

!SLIDE bullets transition=uncover
# Ejemplo de envío de parámetros
	@@@ ruby
	def fib_up_to(max)
		i1, i2 = 1, 1
		while i1 <= max
			yield i1
			i1, i2 = i2, i1+i2
		end
	end

	fib_up_to(1000) {|f| print f, " " }

!SLIDE bullets transition=uncover
# Ejemplo de uso del valor retornado
	@@@ ruby
	class Array
		def my_find
			for i in 0...size
				value = self[i]
				return value if yield(value)
			end
			return nil
		end
	end

	(1..200).to_a.my_find {|x| x%5 == 0}
	(1..200).to_a.my_find {|x| x == 0}

!SLIDE bullets transition=uncover
# Los iteradores
* Las clases que implementan colecciones, como `Array` *hacen lo que hacen
	mejor:*
	* Acceder a los elementos que contienen
* El comportamiento de qué hacer con cada elemento lo delegan a la aplicación
	* Permitiendo que nos concentremos sólo en un requerimiento particular
	* En los casos anteriores (`find`), sería encontrar un elemento para el cual
	  el criterio sea verdadero

!SLIDE bullets small transition=uncover
# Los iteradores `each` y `collect`
* El iterador `each` es el más simple 
	* Solo invoca `yield` para cada elemento
* El iterador `collect` también conocido como `map` 
	* Invoca `yield` para cada elemento. El resultado lo guarda en un nuevo 
	arreglo que es **retornado**

## Ejemplos

	@@@ ruby
	[ 1, 3, 5, 7, 9 ].each {|i| puts i }

	["H", "A", "L"].collect {|x| x.succ }

