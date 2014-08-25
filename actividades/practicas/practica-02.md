
Clases y objetos
================

14. Se quiere administrar una agenda electrónica. De cada contacto
necesita guardarse:

  * Nombre
  * Fecha de nacimiento
  * Email
  * Teléfono
  * Dirección

  Se quiere hacer una aplicación de línea de comandos que permita:

  * Ver todos los contactos
  * Agregar un contacto
  * Editar un contacto
  * Buscar un contacto

  Los datos deben ser guardados en un archivo CSV.

15. Se quiere hacer un conversor de medidas:

  * De pies a metros
  * De metros a pies

  Donde m = ft / 3.2808 (m = meters, ft = feets)

  ¿Que alternativas tenemos para implementar la solución? ¿Cuál considerás
  mejor? ¡Implementala!

16. Crear un archivo de texto plano que tenga el siguiente contenido:

  ```
  '001','Caja de sorpresas',52.50
  '002','Viaje de ida al infinito y mas allá',120
  '003','Historias de chillar',75
  '003','Pegamento de personas',80
  ```

  a. Crear una clase ProductsList que lo parsee y almacene la
  información en una colección de productos.

  b. Teniendo en cuenta la lista de productos anterior, crear una
  clase Purchase que procese órdenes de compra. Dicha clase deberá:

  * Implementar un método \#add(producto) que agregue un producto a la
      orden. Si el producto no está en la lista, no lo agregará a la
      compra.
  * Implementar un método \#total que calcule el total de los elementos
      agregados.

  c. Incorporar lógica de procesamiento de descuentos al sistema
  anterior de manera que si el total supera los \$200, se aplique un
  descuento del 10%

  d. Extender la funcionalidad para que le procesamiento de descuentos
  permita aplicar los siguientes descuentos:

  * Si la compra totaliza más de \$200 se aplica un 10% de descuento
  * Si se llevan 2 unidades de "Historias de chillar" el precio del
      producto baja a \$65

  e. Extender las solución anterior de manera que se puedan agregar y
  modificar reglas descuentos y promociones

17. Se provee la clase Maze que permite resolver laberintos, la
misma cuenta entre otros con los métodos:

* Maze#north, Maze#south, Maze#west, Maze#east: Mueven el jugador
* Maze#obstacle_north?, etc...: Retornan `true` si hay una pared o limite
del mapa en la dirección correspondiente.
* Maze#win?: Retorna true si se llegó al final del laberinto.
* Maze#to_s: Retorna un string con el laberinto y las direcciones cardinales.
En el string el símbolo `@` representa al jugador.

a. Haga un programa que aleje un poco al jugador de su posición inicial
sin chocar.

b. La clase Maze provee otro método `play`, `play` recibe un bloque
y lo ejecuta repetidamente hasta que el mismo retorne true, por ejemplo
el siguiente código mueve el jugador 5 posiciones al este:
```ruby
require_relative 'maze'
maze = Maze::Maze.new
i = 0
maze.play do
  maze.east
  print maze
  i += 1
  i == 5
end
```

Escriba un bloque que implemente una estrategia aleatoria para salir del
laberinto. Como última línea del bloque se puede usar `Maze#win?` para
que la ejecución termine al alcanzar el objetivo.

Ayuda: Puede ser útil tener un array con una entrada por cada método que
mueve al personaje y un array con una entrada por cada pregunta por un
obstáctulo y usar `Maze#send` para invocarlos.



