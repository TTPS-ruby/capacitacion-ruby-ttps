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
