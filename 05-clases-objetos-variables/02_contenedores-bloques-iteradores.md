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

!SLIDE smbullets small transition=uncover
# Arrays usados como pilas y colas
