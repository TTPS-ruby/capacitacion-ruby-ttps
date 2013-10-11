!SLIDE center transition=uncover
# Unit testing

!SLIDE bullets small transition=uncover
# Introducción
* Unit testing es testing que se focaliza en pequeños bloques (o unidades)
  de código
  * Típicamente se testean métodos individuales o líneas complejas de un método
  * Se contrasta con otars estrategias de testing que ven al sistema como un
    todo
* Los sistemas de hoy día se desarrollan en capas donde cada una debería poder
  confiar en que la capa de abstracción utilizada se desempeña correctamente, sin errores.
  * Un error en capas inferiores, causaría errores de propagación a capas
    superiores

!SLIDE bullets transition=uncover
# Introducción
## Una situación
Juan desarrolla una funcionalidad que tiene algún error no detectado. Unos dos
meses después, desarrollamos determinada funcionalidad que, indirectamente utiliza 
lo que Juan ha desarrollado. 

Cuando nuestro código no devuelve los resultados
esperados, nos llevará un tiempo encontrar el problema dentro del código de 
Juan. Es entonces cuando consultamos con Juan: 

***¿Por qué encaraste la solución así?*** 

y la respuesta inmediata será: 

**no recuerdo, fue hace varios meses**

!SLIDE bullets transition=uncover
# Introducción
* Si Juan hubira usado test de unidad para su código, dos cosas hubiesen sucedido: 
  * Juan podría haber encontrado el error cuando el código aún estaba *fresco en
    su mente*
  * Dado que el test de unidad sólo contempla las líneas que Juan escribió,
    cuando ocurrió el problema, podría haber sido mucho más rápido analizar el
    problema entorno al código problemático en vez de hacer arqueología en búsqueda
    del problema en el resto del código

!SLIDE bullets smaller transition=uncover
# ¿Por qué conviene usar test de unidad?

* Ayuda a los desarrolladores a escribir mejor código
  * Empezar escribiendo el test de unidad nos lleva a escribir código de mayor
  calidad y diseños desacoplados
  * Es muy común que nos suceda que por no pensar los tests antes de escribir el
    código, testear el código sea un tanto engorroso o difícil de probar por el
    alto acoplamiento de entidades
* Ayuda mientras escribimos el código, porque nos va dando feedback del
  comportamiento del código y ante nuevas dudas que van surgiendo sobre posibles
  casos extraños, nos permite escribir nuevos tests para agregar a nuestra suite
  y así quedarnos tranquilos que los casos contemplados en el código son testeados
* Ayuda luego de haber escrito el código por dos razones:
  * Chequeando que el código sigue funcionando a medida que el desarrollo crece
  * Permite a otros desarrolladores entender mejor cómo utilizar nuestro código

!SLIDE bullets transition=uncover
# La trivialidad
* Los tests de unidad son simples: 

*consiste en correr un programa que invocan una parte del código de nuestra 
aplicación, obtiene algunos resultados y verifica que  dichos resultados 
sean los esperados*

!SLIDE bullets transition=uncover
# Un ejemplo

* Escribir una clase llamada `Roman` que permita crear objetos con un valor
numérico y que imprima el valor como un número romano

!SLIDE smaller bullets transition=uncover
# El programa

	@@@ ruby
	class Roman
		MAX_ROMAN = 4999
		
		def initialize(value)
			if value <= 0 || value > MAX_ROMAN
				fail "Roman values must be > 0 and <= #{MAX_ROMAN}"
			end
			@value = value
		end
		
		FACTORS = [["m",1000], ["cm",900], ["d",500], ["cd",400],
		           ["c",100], ["xc",90], ["l",50], ["xl",40],
		           ["x",10], ["ix",9], ["v",5], ["iv",4], ["i",1]]

		def to_s
			value = @value
			roman = ""
			for code, factor in FACTORS
				count, value = value.divmod(factor)
				roman << code unless count.zero?
			end
			roman
		end
	end

!SLIDE small bullets transition=uncover
# ¡Lo probamos con los dientes!
* Usando  `irb`

## Escribiendo un programa de test
	@@@ ruby
	require 'roman'
	r = Roman.new(1)
	fail "'i' expected" unless r.to_s == "i"
	r = Roman.new(9)
	fail "'ix' expected" unless r.to_s == "ix"

* Ruby ya incorpora un framework de tests de unidad:
	* Hasta 1.8 era Test::Unit
	* A partir de 1.9 es MiniTest

!SLIDE small smbullets transition=uncover
# Test::Unit vs MiniTest::Unit
* Durante muchos años `Test::Unit` era la opción de la mayor parte de los
  desarrolladores
* Sin embargo, el core team de ruby decidió optar por Minitest::Unit por ser
  mucho más liviano
* La mayor parte de las `assertions` de `MiniTest` se espejan con las
  definidas en `Test::Unit::TesCase`

## Las diferencias
* Ausencia de `assert_not_raises` y `assert_not_throws` en `MiniTest`
* Mientras que en `Test::Unit` se usa `assert_not_nil(x)` y `assert_not(x), en `MiniTest usaremos
  `refute_nil(x)` y `refute(x)` 
* Además:
  * Minitest remueve muchas caracteristicas de Test::Unit que no son tan usadas
  * Si corremos un archivo con tests, MiniTest no invocará los tests en ese
    archivo

!SLIDE bullets transition=uncover
# Test::Unit vs MiniTest::Unit
## Aparecen tres opciones de uso:
* `require 'minitest/unit'` y usaremos únicamente la funcionalidad de **MiniTest**
* `require 'test/unit'`  y usaremos MiniTest con la capa de *compatibilidad* con
	Test::Unit habilitada, agregando las assertions ausentes y la funcionalidad de
	autorun mencionadas
* Instalar la gema `test-unit` y disponer de la funcionalidad original de
	**Test::Unit**

!SLIDE bullets transition=uncover
# El framework de testing
* El framework de testing provisto por Ruby provee básicamente tres
funcionalidades en un mismo paquete:
	* Provee una forma de expresar tests individuales
	* Provee un framework para la estructuración de los tests
	* Ofrece diversas formas flexibles de invocar los tests

!SLIDE bullets transition=uncover
# Assertions
* En vez de escribir un montón de `if/unless` se utilizan **assertions** que
	provee el framework de test
* Existen muchos tipos de assertions, pero básicamente todos siguen el mismo
	patrón: 
	* Cada assertion provee una forma de especificar un *resultado esperado* y la
	  forma de pasar el valor actual 
	* Si el valor actual no es el *resultado esperado*, la assertion imprimirá un
	  mensaje y contabilizará el fallo

!SLIDE bullets transition=uncover
# El ejemplo de Roman
## Reescribimos los tests que hicimos con los dientes
	@@@ ruby
	require 'roman'
	require 'test/unit'
	class TestRoman < MiniTest::Unit::TestCase
		def test_simple
		  assert_equal("i", Roman.new(1).to_s)
		  assert_equal("ix", Roman.new(9).to_s)
		end
	end

*Lo probamos*

!SLIDE bullets transition=uncover
# Agregamos más assertions
	@@@ ruby
	require 'roman'
	require 'test/unit'
	class TestRoman < MiniTest::Unit::TestCase
		def test_simple
		  assert_equal("i", Roman.new(1).to_s)
		  assert_equal("ii", Roman.new(2).to_s)
		  assert_equal("iii", Roman.new(3).to_s)
		  assert_equal("iv", Roman.new(4).to_s)
		  assert_equal("ix", Roman.new(9).to_s)
		end
	end

*Lo probamos*

!SLIDE center transition=uncover
## Encontramos un 
<br />
<div class="error"> ERROR </div> 

!SLIDE bullets transition=uncover
# Analizamos el problema
## Miramos el `to_s` 

	@@@ ruby
	def to_s
	  value = @value
	  roman = ""
	  for code, factor in FACTORS
	    count, value = value.divmod(factor)
	    roman << (code * code)
	    # cambiamos: unless count.zero?
	  end
	  roman
	end

*Lo probamos*

!SLIDE small bullets transition=uncover
# Refactorizando el test
## Para no repetir los asserts, podemos:
	@@@ ruby
	require 'roman'
	require 'test/unit'
	class TestRoman < Test::Unit::TestCase
	  NUMBERS = [
	             [ 1, "i" ], [ 2, "ii" ], [ 3, "iii" ],
	             [ 4, "iv"], [ 5, "v" ], [ 9, "ix" ]
	            ]
	  def test_simple
	    NUMBERS.each do |arabic, roman|
	      r = Roman.new(arabic)
	      assert_equal(roman, r.to_s)
	    end
	  end
	end

* Podemos testear muchas cosas, por ejemplo el constructor de la clase `Roman`

!SLIDE small bullets transition=uncover
# Testeamos el rango de Roman
## Verificamos si se lanzan las excepciones
	@@@ ruby
	require 'roman'
	require 'test/unit'
	class TestRoman < Test::Unit::TestCase
		def test_range
			# no exception for these two...
			Roman.new(1)
			Roman.new(4999)
			# but an exception for these
			assert_raises(RuntimeError) { Roman.new(0) }
			assert_raises(RuntimeError) { Roman.new(5000) }
		end
	end

* Analicemos qué más testear en la clase `Roman` que genera números hasta 4999. Ver carpeta `samples/10/romans`

!SLIDE smaller bullets transition=uncover
# Listado de assertions
	@@@ ruby
	assert | refute(boolean, [ message ] )
	# Fails if boolean is (is not) false or nil.
	
	assert_block { block }
	# Expects the block to return true.

	assert_ | refute_empty(collection, [ message ] )
	# Expects empty? on collection to return true (false).

	assert_ | refute_equal(expected, actual, [ message ] )
	# Expects actual to equal/not equal expected, using ==.

	assert_ | refute_in_delta(expected_float, actual_float, 
	                          delta, [ message ] )
	# Expects that the actual floating-point value is (is not) 
	# within delta of the expected value.

	assert_ | refute_in_epsilon(expected_float, actual_float, 
	                            epsilon=0.001, [ message ] )
	# Calculates a delta value as epsilon * min(expected, actual),
	# then calls the _in_delta test.

	assert_ | refute_includes(collection, obj, [ message ] )
	# Expects include?(obj) on collection to return true (false).

!SLIDE smaller bullets transition=uncover
# Listado de assertions
	@@@ ruby
	assert_ | refute_instance_of(klass, obj, [ message ] )
	# Expects obj to be (not to be) a instance of klass.

	assert_ | refute_kind_of(klass, obj, [ message ] )
	# Expects obj to be (not to be) a kind of klass.

	assert_ | refute_match(regexp, string, [ message ] )
	# Expects string to (not) match regexp.

	assert_ | refute_nil(obj, [ message ] )
	# Expects obj to be (not) nil.

	assert_ | refute_operator(obj1, operator, obj2, [ message ] )
	# Expects the result of sending the message operator to obj1 
	# with parameter obj2 to be (not to be) true.

	assert_raises(Exception, . . . ) { block }
	# Expects the block to raise one of the listed exceptions.

	assert_ | refute_respond_to(obj, message, [ message] )
	# Expects obj to respond to (not respond to) message (a symbol).

	assert_ | refute_same(expected, actual, [ message ] )
	# Expects expected.equal?(actual).

!SLIDE smaller bullets transition=uncover
# Listado de assertions
	@@@ ruby
	assert_send(send_array, [ message ] )
	# Sends the message in send_array[1] to the receiver in 
	# send_array[0], passing the rest of send_array as arguments. 
	# Expects the return value to be true.

	assert_throws(expected_symbol, [ message ] ) { block }
	# Expects the block to throw the given symbol.

	flunk(message="Epic Fail!")
	# Always fails.

	skip(message)
	# Indicates that a test is deliberately not run.

	pass
	# Always passes.

* Notar que el último parámetro es un mensaje que será usado en la salida ante
	un error.
	* Generalmente no es necesario usarlo porque el error es bastante claro,
	  salvo  `refute_nil` que devolvería *Expected nil to not be nil*

!SLIDE smaller bullets transition=uncover
# Estructurando los tests
* Los tests de unidad nos llevan a dos agrupamientos:
	* **De alto nivel**: llamados *test cases*. Contienen todos los tests para una
	  característica determinada. En el ejemplo de `Roman` alcanza con un único
	  test case. Las clases que representan test cases, deben ser subclase de:
	  `Test::Unit::TestCase`

	* **De bajo nivel**: que serían los métodos de test en sí. Los assertions
	  podríamos escribirlos todos mezclados, pero en su lugar los agrupamos en
	  métodos dentro del test case de forma de que los assertions en un método se
	  corresponden con un tipo de test: *uno testearía manejo de errores, otro
	  métodos de inicialización, límites, etc*. Los métodos de test, deben
	  comenzar con el prefijo **test** para que sean seleccionados como tales
* Generalmente queremos ejecutar determinado código antes y luego de cada test.
	Disponemos entonces de:
	* `setup`
	* `teardown`
	* Ver `samples/10/setup-teardown`

!SLIDE smaller bullets transition=uncover
# Cómo correr los tests

