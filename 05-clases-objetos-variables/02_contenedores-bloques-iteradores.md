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

* El rango indica los índices **desde** y **hasta**
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
* Podemos invocar los siguientes métodos de `Array`
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
  * La entrada a almacenar en dicho índice, generalmente llamado *valor*
* El acceso a los valores referenciados por un hash se realiza por medio de los
  *keys*

## Un ejemplo

	@@@ ruby
	h = { 'dog' => 'canine', 'cat' => 'feline' }
	h.length # => 2
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
* Utilizaremos un framework de test llamado `Minitest`
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
	require 'minitest/autorun'

	class TestWordsFromString < Minitest::Test
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
	require 'minitest/autorun'

	class TestCountFrequency < Minitest::Test
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
	top_five.each { |word, count| puts "#{word}: #{count}" }

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

	['k','h','m','t','w'].collect {|x| x.succ }

!SLIDE smbullets smaller transition=uncover
# Otros usos de iteradores 
* Los iteradores no solo se usan con array y hash
* Su lógica es muy utilizada en las clases de entrada / salida
  * Estas clases implementan una interfaz de iterador que retorna líneas
    sucesivas o bytes si trabajamos en bajo nivel

## Ejemplo
	@@@ ruby
	f = File.open("testfile")
	f.each { |line| puts "The line is: #{line}"}
	f.close

## Y si necesitamos el índice
	@@@ ruby
	f = File.open("testfile")
	f.each_with_index do |line, index| 
		puts "Line #{index} is: #{line}" 
	end
	f.close

!SLIDE smbullets small transition=uncover
# El caso de `inject`
* Este iterador tiene un nombre *raro*
* Permite acumular un valor a lo largo de los miembros de una colección
* Recibe un parámetro que es el valor inicial para comenzar a acumular
	* Si no se especifica **toma el primer elemento de la colección**

## Ejemplos
	@@@ ruby
	[1,3,5,7].inject(0) {|sum, element| sum+element}
	[1,3,5,7].inject {|sum, element| sum+element}

	[1,3,5,7].inject(1) {|prod, element| prod*element}
	[1,3,5,7].inject {|prod, element| prod*element}

!SLIDE smbullets small transition=uncover
# El caso de `inject`
## Generando más mística para `inject`

	@@@ ruby

	[1,3,5,7].inject(:+)


	[1,3,5,7].inject 100, :+ 


	[1,3,5,7].inject(:*)

!SLIDE bullets transition=uncover
# Enumerators
* Los iteradores son muy cómodos pero:
	* Son parte de la colección y no una clase a parte
	* En otros lenguajes (como Java), las colecciones no implementan sus
	  iteradores, sino que son clases separadas (como por ejemplo la interfaz 
		Iterator de Java)
	* Es complicado iterar dos colecciones simultáneamente

!SLIDE bullets smaller transition=uncover
# Enumerators

* La solución: clase `Enumerator`
	* Se obtiene de una colección con el método `to_enum` o `enum_for`

## Ejemplo

	@@@ ruby
	a = [ 1, 3, "cat" ]
	h = { dog: "canine", fox: "lupine" }
	# Create Enumerators
	enum_a = a.to_enum
	enum_h = h.to_enum
	enum_a.next 	# => 1
	enum_h.next 	# => [ :dog, "canine" ]
	enum_a.next 	# => 3
	enum_h.next 	# => [ :fox, "lupine" ]

*Si un iterador se utiliza sin bloque, entonces retorna un Enumerator*

	@@@ ruby
	a = [1,2,3].each
	a.next

!SLIDE smbullets smaller transition=uncover
# El método `loop`
* Ejecuta el código que se encuentra dentro del bloque
* Se puede salir con break cuando se cumple una condición
* Si hay iteradores, `loop` terminará cuando el Enumerator se quede sin valores

## Ejemplos
	@@@ ruby
	loop { puts "Hola" }

	i=0
	loop do
		puts i += 1
		break if i >= 10
	end

	short_enum = [1, 2, 3].to_enum
	long_enum = ('a'..'z').to_enum
	loop { puts "#{short_enum.next} - #{long_enum.next}" }

!SLIDE bullets small transition=uncover
# Usando `Enumerator` como objetos
*  Sabemos que es posible usar `each_with_index` en `Array`

## Ejemplo

	@@@ ruby
	result = []
	[ 'a', 'b', 'c' ].each_with_index do |item, index| 
		result << [item, index] 
	end

!SLIDE smbullets smaller transition=uncover
# Usando `Enumerator` como objetos

## ¿Y si queremos hacer lo mismo con un `String`?
* No existe `each_with_index` en `String`
* Pero sí existe `each_char` que es como `each` de `Array` pero sobre cada
	caracter del string
	* Si no enviamos un bloque, retornará un `Enumerator`
* La interfaz `Enumerable` define el método `each_with_index`

## El código quedaría
	@@@ ruby
	result = []
	"cat".each_char.each_with_index do |item, index| 
			result << [item, index] 
	end
	# Incluso Matz nos simplifico mas...
	result = []
	"cat".each_char.with_index do |item, index| 
			result << [item, index] 
	end

!SLIDE smbullets small transition=uncover
# `Enumerator` como generadores
* Podemos crear objetos enumerator explícitamente en vez de hacerlo a partir de
	una colección
* Para ello es necesario utilizar un bloque en la creación
	* El código del bloque se usará por el objeto Enumerator cada vez que el
	  programa principal le solicite un nuevo valor
	* Este bloque no se ejecutará como otros bloques dado que su ejecución
	  se disparará cada vez que se solicita el siguiente valor
  * La ejecución del bloque se pausa y vuelve al programa principal cuando se
    encuentra `yield`
  * Cuando se solicita el siguiente valor, el código del bloque continúa a
    partir de la línea siguiente al `yield`
* Esto permite generar **secuencias infinitas** 

!SLIDE smbullets small transition=uncover
# `Enumerator` como generadores
	@@@ ruby
	fibonacci = Enumerator.new do |caller|
		i1, i2 = 1, 1
		loop do
			caller.yield i1
			i1, i2 = i2, i1+i2
		end
	end

	6.times { puts fibonacci.next }

## Como `Enumerator` es `Enumerable`

	@@@ ruby
	fibonacci.first(1000).last

!SLIDE smbullets smaller transition=uncover
# Hay que tener cuidado!!
* Cuidado con los enumerators que generan listas infinitas
* Los metodos comunes de los enumeradores como `count` y `select` tratarán de
	leer todos los elementos antes de retornar un valor
	* Podemos escribir la versión de `select` adecuada a nuestra lista
	  infinita

## Ejemplo
	@@@ ruby
	def infinite_select(enum, &block)
		Enumerator.new do |caller|
			enum.each do |value|
				caller.yield(value) if block.call(value)
			end
		end
	end
	
	p infinite_select(fibonacci) {|val| val % 2 == 0}.first(5)

!SLIDE smbullets smaller transition=uncover
# Haciendo algo más conveniente
* Podemos escribir filtros como `infinite_select` directamente en la clase
  `Enumerator`
* Esto nos permitirá encadenar filtros:

## Ejemplo
	@@@ ruby
	class Enumerator
		def infinite_select(&block)
			Enumerator.new do |caller|
				self.each do |value|
					caller.yield(value) if block.call(value)
				end
			end
		end
	end
	
	p fibonacci.
		infinite_select {|val| val % 2 == 0}.
		infinite_select {|val| val.to_s =~ /13\d$/ }.
		first(2)

!SLIDE smbullets small transition=uncover
# Bloques como transacciones
* Podemos usar bloques para definir código que debe ejecutarse bajo ciertas
	condiciones transaccionales.
* Por ejemplo:
	* Abrir un archivo
	* Procesarlo
	* Cerrarlo
* Si bien esto podemos hacerlo secuencialmente, utilizando bloques simplificamos
	mucho 

## Ejemplo básico
	@@@ ruby
	class File
		def self.open_and_process(*args)
			f = File.open(*args)
			yield f
			f.close()
		end
	end

!SLIDE smbullets small transition=uncover
# Analizamos un poco...
* El método de clase implementado fue desarrollado para que entienda los mismos
	parámetros que `File.open` 
* Para ello, lo que hicimos es pasar los parámetros tal cual se enviaron a
	`File.open`
	* Esto se logra definiendo como argumento al método `*args` que significa:
	  *tomar todos los argumentos enviados al método actual y colocarlos en un
		arreglo llamado args*
	* Luego llamamos a `File.open(*args)`. Utilizar *args vuelve a expandir los
	  elementos del arreglo a parámetros individuales
* Esta técnica es tan útil, que `File.open` ya lo implementa
	* Además de usar `File.open` para abrir un archivo, podemos usarlo para
	  directamente procesarlo como lo hacíamos con `open_and_process`

!SLIDE smbullets transition=uncover
# Una versión más completa de `my_open`
	@@@ ruby
	class File
		def self.my_open(*args)
			result = file = File.new(*args)
			if block_given?
				result = yield file
				file.close
			end
			return result
		end
	end

* Podría suceder un error en el procesamiento
* Para asegurar el cierre del archivo, se deben usar excepciones, que veremos 
	más adelante

!SLIDE smbullets smaller transition=uncover
# Los bloques pueden ser objetos
* Recordamos que anteriormente mencionamos que los bloques son como un parámetro
	adicional pasado a un método
* Además podremos hacer que los bloques sean parámetros explícitos
	* Si el último parámetro en un método se prefija con ampersand (como 
	&action), Ruby buscará el codigo de un bloque cuando el método es invocado
	* Este parámetro podrá utilizarse como cualquier otro

## Ejemplo
	@@@ ruby
	class ProcExample
		def pass_in_block(&action)
			@stored_proc = action
		end
		def use_proc(parameter)
			@stored_proc.call(parameter)
		end
	end

	eg = ProcExample.new
	eg.pass_in_block { |param| puts "The parameter is #{param}" }
	eg.use_proc(99)

!SLIDE smbullets small transition=uncover
# Avanzando un poco más...
* Vemos que `call` invoca la ejecución del bloque 
* Muchos programas utilizan esta idea para implementar **callbacks**
* ¿Qué pasaría si retornamos el bloque?

## Lo analizamos
	@@@ ruby
	def create_block_object(&block)
		block
	end

	bo = create_block_object do |param| 
		puts "You called me with #{param}"
	end
	bo.call 99
	bo.call "cat"

!SLIDE smbullets transition=uncover
# `Proc` y `lambda`
* Devolver un bloque es tan útil que en Ruby hay dos formas de hacerlo:
	* `lamda` y `Proc.new` toman un bloque y retornan un objeto
	* El objeto retornado es de la clase `Proc`
	* La diferencia entre `lambda` y `Proc.new` la veremos más adelante, pero ya
	  hemos mencionado que `lambda` controla los parámetros que requiere el
		bloque, mientras que `Proc` no lo hace

!SLIDE bullets small transition=uncover
# Los bloques pueden ser Closures
* Recordamos haber mencionamos que los bloques pueden utilizar variables que
	están dentro del alcance del bloque
* Veremos ahora un uso diferente de un bloque haciendo esto

## Ejemplo
	@@@ ruby
	def n_times(thing)
		lambda {|n| thing * n }
	end
	p1 = n_times(10)
	p1.call(3)
	p1.call(4)
	p2 = n_times("Hola ")
	p2.call(3)

!SLIDE smbullets smaller transition=uncover
# ¿Qué es un Closure?
* El método `n_times` referencia el parámetro `thing` que es usado por el bloque
* Aunque en las llamadas a `call` (y por ende en la ejecución del bloque) el 
	parámetro `thing` está fuera del alcance, el parámetro se mantiene accesible
	dentro del bloque
* Esto es un closure:
	* Variables en el alcance cercano que son referenciadas por el bloque se
	  mantienen accesibles por la vida del bloque y la vida del objeto Proc creado
		para este bloque

## Otro ejemplo
	@@@ ruby
	def what_do_i_do?
		value = 1
		lambda { value += value }
	end

	let_me_see = what_do_i_do?
	let_me_see.call
	let_me_see.call

!SLIDE smbullets small transition=uncover
# Notación alternativa
## A partir de ruby 1.9 
	@@@ ruby
	lambda { |params| ... }

	# es equivalente a

	->params { ... }

	# Y con parámetros

	proc1 = -> arg {puts "proc1:#{arg}" }
	proc2 = -> arg1, arg2 {puts "proc2:#{arg1} y #{arg2}" }
	proc3 = ->(arg1, arg2) {puts "proc3:#{arg1} y #{arg2}" }

	proc1.call "ant"
	proc2.call "bee", "cat"
	proc3.call "dog", "elk"

!SLIDE transition=uncover
# Locas ideas
## Reimplementamos un while usando bloques

	@@@ ruby
	def my_while(cond, &body)
		while cond.call
			body.call
		end
	end

	a = 0
	my_while -> { a < 3 } do
		puts a
		a += 1
	end

!SLIDE bullets smaller transition=uncover
# Lista de parámetros a un bloque
* Los argumentos a un bloque, al igual que los argumentos a un método podrán ser:
	* Argumentos splat, que se reemplazan por un arreglo como vimos en un ejemplo
	  previo (usando *)
	* Inicializados con un valor por defecto
	* Bloques como parámetro (usando & en el último parámetro)

## Ejemplo
	@@@ ruby
	proc1 = lambda do |a, *b, &block|
		puts "a = #{a.inspect}"
		puts "b = #{b.inspect}"
		block.call
	end
	proc1.call(1, 2, 3, 4) { puts "in block1" }

	proc2 = -> a, *b, &block do
		puts "a = #{a.inspect}"
		puts "b = #{b.inspect}"
		block.call
	end
	proc2.call(1, 2, 3, 4) { puts "in block2" }


