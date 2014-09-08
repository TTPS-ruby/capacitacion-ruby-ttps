
Bloques y funciones
-------------------

1. Analice las siguientes funciones:
  ```ruby
  def fun1(a, b)
    a * b
  end

  def fun2(a, b = 5)
    a * b
  end

  def fun3(*a)
    a.inject(1, :*)
  end
  ```

  a. ¿Qué sucede al invocar a cada una de estas funciones con un sólo
  argumento?
  b. En cada caso analizar que sucede al invocar a la función de la siguiente
  forma: `funx(b = 2, a = 1)`

1. Implemente la función `tipos_de_argumentos` que se pueda utilizar como se
muestra más abajo e imprima los argumentos recibidos:

  ```
  > tipos_de_argumentos 2, 'hello' => 'world', 'amount' => 5
  Argumento posicional: 2
  Argumentos en el hash
    hello: world
    amount: 5
  ```

  Nota: esta función solamente recibe un argumento posicional.

1. Analice las diferencias entre los siguientes usos de bloques:
  ```ruby
  def fun1
    yield
  end

  def fun2(&block)
    block.yield
  end

  def fun3(&block)
    block.yield unless block.nil?
  end

  def fun4
    yield if block_given?
  end
  ```
  a. ¿En qué casos es obligatorio invocar a la función con un bloque?
  b. ¿Qué pasa cuando no se envía un bloque?
  c. ¿Qué retorna cada función?

1. Implemente una función `inject` para ejercitar el uso de bloques (sin usar
`inject` ni `reduce`). La forma de uso de esta función sería:

  ```
  > p inject([1,2,3,4,5,6], 1) { |acum, x| acum * x }
  => 720

1. Pruebe los siguientes fragmentos de código y analice los resultados:

  a.
  ```
  def fun1
    proc { return 'sale del bloque' }.call
    'sale de fun1'
  end

  def fun2
    -> { return 'sale del lambda' }.call
    'sale de fun2'
  end

  p fun1
  p fun2
  ```

  b.
  ```
  lambda1 = -> (a, b) { puts a, b }
  bloque1 = proc { |a, b| puts a, b }
  bloque1.call 2, 5
  bloque1.call 2
  lambda1.call 2, 5
  lambda1.call 2
  ```

Módulos y mixings
-----------------


Clases y objetos
----------------

1. Crear una clase `Contribuyente` que tenga los siguientes atributos (todos
deben tener accesors):
  * nombre
  * apellido
  * cuit
  * deuda
  * ingresos

  En caso de no especificarse deuda al instanciar el `Contribuyente`
  la misma será 0 y en caso de no especificar ingresos se deberá asumir
  que gana el salario mínimo.

1. Crear una clase `Impuesto`, los objetos `Impuesto` deberán tener
como atributo el nombre del impuesto y proveer los métodos:
  * `Impuesto#monto_a_pagar(contribuyente)` retorna el monto a pagar por el
    contribuyente dado.
  * `Impuesto#calculo(&bloque)` usa el bloque dado para calcular el monto
    a pagar en futuras invocaciones del método `Impuesto#monto_a_pagar`.

  Al instanciar un `Impuesto` se asume que el monto a pagar será el 3% de los
  ingresos y si el `Contribuyente` tiene deuda se sumará la deuda más un
  15% sobre el total.

1. Crear una clase `Contribuyentes`, la misma deberá ser una colección de
objetos `Contribuyente` que permita realizar las siguientes acciones:

  * Agregar un `Contribuyente` a la colección (verificar que no haya cuits
  duplicados).
  * Obtener un listado de los contribuyentes que tengan una deuda del
  50% o más de sus ingresos.
  * Obtener un listado de los contribuyentes sin deuda.
  * La clase `Contribuyentes` deberá incorporar los comportamientos
  de `Enumerable`.
  * `max`, `min` y `sort` deberán operar en base a los ingresos del
  `Contribuyente`.

1. Agrupar las clases `Contribuyente`, `Impuesto` y `Contribuyentes` en el
módulo `AgenciaRecaudadora` y hacer un programa en otro archivo `.rb` que
use estas clases.


1. Emparchar la clase `Range` para que acepte el método `Range#lcm` que
calcula el mínimo común múltiplo (least common multiple) entre los números
del rango. Por ejemplo:

  ```
  > (1..10).lcm
  => 2520
  > (1..20).lcm
  => 232792560
  ```

1. Se quiere administrar una agenda electrónica. De cada contacto necesita
guardarse:

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

1. Se quiere hacer un conversor de medidas:

  * De pies a metros
  * De metros a pies

  Donde m = ft / 3.2808 (m = meters, ft = feets)

  ¿Que alternativas tenemos para implementar la solución? ¿Cuál considerás
  mejor? ¡Implementala!

1. Crear un archivo de texto plano que tenga el siguiente contenido:

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

1. Se provee la clase Maze que permite resolver laberintos, la
misma cuenta entre otros con los métodos:

  * Maze#north, Maze#south, Maze#west, Maze#east: Mueven el jugador
  * Maze#obstacle_north?, etc...: Retornan `true` si hay una pared o limite
  del mapa en la dirección correspondiente.
  * Maze#win?: Retorna true si se llegó al final del laberinto.
  * Maze#to_s: Retorna un string con el laberinto y las direcciones cardinales.
  En el string el símbolo `@` representa al jugador.

  a. Haga un programa que aleje al jugador 10 pasos de su posición inicial
  sin chocar.

  b. La clase Maze provee otro método `play`, `play` recibe un bloque
  y lo ejecuta repetidamente hasta que el mismo retorne true, por ejemplo
  el siguiente código mueve al jugador hacia el este hasta que choque:
  ```ruby
  require_relative 'maze'
  maze = Maze::Maze.new
  i = 0
  maze.play do
    maze.east
    print maze
    maze.obstacle_east?
  end
  ```

  Escriba un bloque que implemente una estrategia aleatoria para salir del
  laberinto. Como última línea del bloque se puede usar `Maze#win?` para
  que la ejecución termine al alcanzar el objetivo.

  Ayuda: Considere usar `Maze#send` para invocar algunos métodos para evitar
  usar un `case` o varios `if`.



