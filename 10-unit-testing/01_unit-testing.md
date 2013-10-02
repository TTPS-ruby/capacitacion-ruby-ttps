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

!SLIDE smaller bullets transition=uncover
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

