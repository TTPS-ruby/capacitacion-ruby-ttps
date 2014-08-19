TTPS Opción Ruby

Práctica 1
----------

Tipos básicos y sintaxis
========================

__Nota: No usar while, for ni repeat.__

1. Investigue y pruebe como crear objetos de los siguientes tipos usando
literales y usando __new__ (cuando se pueda):
  * Un arreglo.
  * Un hash.
  * Un string.
  * Un símbolo.

2. Investigue que métodos se pueden usar para:
  * Obtener la lista de métodos de una clase.
  * Obtener la lista de métodos de instancia de un clase.
  * Obtener la lista de variables de instancia de una clase.

3. ¿Cuál es la diferencia entre las siguientes sentencias?:
  * `String.methods`
  * `'Hola'.methods`
  * `String.methods false`

4. Escriba una función que reciba un __hash__ y retorne un __string__
con una lista en HTML que contenga las claves y valores del __hash__.
Por ejemplo:
```ruby
> to_html({bananas: 5, naranjas: 10})
=> "<ul><li>bananas: 5</li><li>naranjas: 10</li></ul>"
```

5. Si listamos todos los números naturales menores que 10 que son
múltiplos de 3 o 5 obtenemos 3, 5, 6 y 9. La suma de todos estos números
es 23. Encontrá la suma de todos los múltiplos de 3 o 5 menores que
1000.

6. Cada nuevo término en la secuencia de Fibonacci es generado sumando
los 2 términos anteriores. Los primeros 10 términos
son: 1, 1, 2, 3, 5, 8, 13, 21, 34, 55. Considerando los términos en la
secuencia de Fibonacci cuyos valores no exceden los 4 millones, encontrá
la suma de los términos pares.

3. Un número palíndromo se lee igual al derecho y al revés. El número
palíndromo más grande obtenido de la multiplicación de dos números de 2
dígitos es 9009 (91 x 99 = 9009). Encontrá el palíndromo más grande
obtenido a través de la multiplicación de dos números de 3 dígitos.

4. 2520 es el número más chico que puede ser dividido por cada uno de
los números del 1 al 10 sin obtener resto. ¿Cual es el número más chico
que puede ser dividido por cada uno de los números del 1 al 20?

5. La suma de los cuadrados de los primeros 10 números naturales es 385
(1^2^ + 2^2^ + … + 10^2^ = 385). El cuadrado de la suma de los primeros
10 números naturales es 3025 ((1 + 2 + … + 10)^2^ = 55^2^ = 3025). Por
lo tanto, la diferencia entre el cuadrado de la suma y la suma de los
cuadrados de los primeros 10 números naturales es 2640 (3025 - 385 =
2640). Encontrá la diferencia entre el cuadrado de la suma y la suma de
los cuadrados de los primeros 100 números naturales.

6. La lista de los primeros 6 números primos es 2, 3, 5, 7, 11 y 13. Se
puede observar que el 6to número primo es 13. ¿Cual es el número primo
nro 10001?

7. La suma de los primos menores que 10 es 17 (2 + 3 + 5 + 7 = 17).
Encontrá la suma de todos los primos menores que 2 millones.

8. Dado un arreglo de strings cualquiera, es necesario escribir un
método que devuelva un arreglo con la longitud de dichos strings.
Ejemplo: dado ['Ruby', 'is', 'awesome'] debe retornar [4, 2, 7]

9. Dado un color expresado como una combinación RGB calcular su
representación entera. Consideramos que un color rgb se expresa como un
hash con las claves [:red, :green, :blue], y para cada una toma valores
en el rango (0..255). Por ejemplo:

- `{ red: 0, green: 0, blue: 255 }`
- `{ red: 128, green: 128, blue: 255 }`

La representación entera se calcula como: red + green\*256 + blue\*256²

9.b - Realizar el mismo cálculo obteniendo los coeficientes para cada
componente del color de otro hash coefficients = { red: 256⁰, green:
256¹, blue: 256² }

Clases y objetos
================

10. Se quiere administrar una agenda electrónica. De cada contacto
necesita guardarse:

-   Nombre

-   Fecha de nacimiento

-   Email

-   Teléfono

-   Dirección

Se quiere hacer una aplicación de línea de comandos que permita:

-   Ver todos los contactos

-   Agregar un contacto

-   Editar un contacto

-   Buscar un contacto

Los datos deben ser guardados en un archivo CSV.

11. Se quiere hacer un conversor de medidas:

-   De pies a metros

-   de metros a pies

Donde m = ft / 3.2808 (m = meters, ft = feets)

¿Que alternativas tenemos para implementar la solución? ¿Cuál considerás
mejor? ¡Implementala!

12.Crear un archivo de texto plano que tenga el siguiente contenido:

```
'001','Caja de sorpresas',52.50
'002','Viaje de ida al infinito y mas allá',120
'003','Historias de chillar',75
'003','Pegamento de personas',80
```

12.a - Crear una clase ProductsList que lo parsee y almacene la
información en una colección de productos.

12.b - Teniendo en cuenta la lista de productos anterior, crear una
clase Purchase que procese órdenes de compra. Dicha clase deberá:

-   Implementar un método \#add(producto) que agregue un producto a la
    orden. Si el producto no está en la lista, no lo agregará a la
    compra.

-   Implementar un método \#total que calcule el total de los elementos
    agregados.

12.c - Incorporar lógica de procesamiento de descuentos al sistema
anterior de manera que si el total supera los \$200, se aplique un
descuento del 10%

12.d - Extender la funcionalidad para que le procesamiento de descuentos
permita aplicar los siguientes descuentos:

-   Si la compra totaliza más de \$200 se aplica un 10% de descuento

-   Si se llevan 2 unidades de "Historias de chillar" el precio del
    producto baja a \$65

12.e - Extender las solución anterior de manera que se puedan agregar y
modificar reglas descuentos y promociones

13. En un juego de combate marcial participan 2 jugadores. Cada jugador
posee una energía vital, la cual varía durante el combate. El combate se
organiza en una serie de turnos, en cada turno el jugador decide qué
movimiento realizar (golpear o bloquear). El combate dura como máximo 10
turnos, y cada jugador comienza el mismo con 100 puntos de energía. Al
final del combate puede suceder que:

-   Un jugador se quede sin energía, por lo tanto pierde (y gana su
    oponente).

-   Ambos jugadores se quedan sin energía en el mismo turno, en este
    caso empatan.

-   Ambos jugadores terminan el combate con energía mayor que 0. En este
    caso gana aquel con más energía. En cada turno los jugadores pueden
    bloquear o golpear. Por lo tanto de se pueden dar 3 casos:

    -   El jugador A golpea y el jugador B bloquea: en este caso el que
        golpea (A) pierde 10 puntos de energía.

    -   Ambos jugadores bloquean: en este caso la energía de ambos se
        mantiene igual.

    -   Ambos golpean: el jugador A resta de su energía el 20% de la
        energía que tiene B, y el jugador B resta el 20% de la energía
        que tiene A.

A modo de ejemplo considere la siguiente secuencia de turnos:

Turno

Mov Jug A

Mov Jug A

Energía A

Energía B

0

-

-

100

100

1

Bloqueo

Bloqueo

100

100

2

Bloqueo

Golpe

100

90

3

Golpe

Golpe

82

70

\

Usted debe implementar un sistema (clase Juego) donde, dados 2 jugadores
que pueden responder con un movimiento para cada turno, determine quién
gana o si hubo empate. Su implementación debe respetar las siguiente
indicaciones:

-   La clase Jugador debe entender el mensaje "\#jugada(nro\_turno)"
    (donde nro\_turno es un entero entre 1 y 10) que retorna la jugada
    para ese turno.

-   La clase Jugador debe entender el mensaje "\#nombre" que retorna el
    nombre del mismo.

-   La clase Juego debe implementar el mensaje:
    "\#determinar\_ganador(jugador\_a, jugador\_b)"

13.a - Implemente.

13.b - Instancie los jugadores con sus correspondientes movimientos y
verique quien gana.


Práctica 1
----------

Primeros pasos
==============

Antes de comenzar esta práctica es necesario tener git instalado.
Asegurate que tengas git instalado ejecutando el siguiente comando:

```sh
$ sudo apt-get install git
```

Obteniendo ayuda
================

Para cualquier comando de git podés usar el subcomando help. Por
ejemplo:

```sh
$ git help status
```

nos va a mostrar las opciones del subcomando status.

Otro punto a tener en cuenta es la salida del subcomando **status**.
Dicha salida es sumamente detallada respecto de las acciones que se
pueden hacer. Prestale atención!

Estados de git
==============

¿Cuales son los 3 estados? ¿Qué significa cada uno?

Setup inicial
=============

Antes de hacer nada, es necesario hacer un setup inicial de git. En
dicho setup, vamos a decirle a git nuestra identidad y cuales son
nuestras herramientas de preferencia. En primer lugar, vamos a decirle a
git cual es nuestro nombre:

```sh
$ git config --global user.name "Nombre Completo"
```

y nuestro email:

```sh
$ git config --global user.email "nombrecompleto@gmail.com"
```

Luego, le vamos a decir a git cual es nuestro editor de texto preferido:

```sh
$ git config --global core.editor vim
```

y nuestra herramienta de diff preferida:

```sh
$ git config --global merge.tool vimdiff
```

Como se puede observar, las preferencias fueron configuradas de forma
global, lo que significa que pueden ser sobreescritas de forma local.

Creando un repositorio
======================

1. Crea un directorio llamado **first\_repo**

2. Inicializá un repositorio git en el directorio
**first\_repo**

Agregando archivos
==================

3. Crea el archivo **README.md** (la extensión **md** significa
que el archivo está escrito en markdown) con el siguiente texto:

```
# First repo
```

4. Agregá el archivo **README.md** al área de staging.
**Ayuda:** mirá el subcomando **add**.


5. ¿Cómo te das cuenta que el archivo está en el área de staging?
**Ayuda:** mirá la salida del subcomando **status**.


Comitiendo los cambios
======================

6. Los archivos ya están agregados al área de staging, lo que queremos
hacer ahora es crear un commit y guardarlo en el repositorio git.
**Ayuda:** mirá el subcomando **commit**.

Viendo la historia
==================

7. ¿Cuál es el hash del commit recién creado? **Ayuda:** mirá el
subcomando **log**.

Deshaciendo cambios
===================

8. Agregá un archivo más llamado **file.txt** y comití los
cambios con el siguiente mensaje: "Agregando otro archivo"

9. El commit anterior tiene un mensaje corto y poco descriptivo:
cambialo. **Ayuda:** mirá la opción **--amend** del subcomando
**commit**.

10. Surgió otro problema con el commit anterior: ahora te olvidaste de
agregar un archivo llamado **oops**. Agregá el archivo al commit
anterior.

11. Crea el archivo **file2.txt** y agregalo al área de
staging. Luego de trabajar nos dimos cuenta que no queremos comitir ese
archivo: sacalo del área de staging. **Ayuda:** mirá la salida del
subcomando **status**.

12. Modificá el archivo **README.md** con el siguiente
contenido:

```
# Second repo
```

y agregá el archivo al área de staging.

13. Resulta que las modificaciones realizadas en el punto anterior son
incorrectas y no las queremos: revertí los cambios. **Ayuda:** mirá
la salida del subcomando **status**.

Trabajando con remotos
======================

14. ¿El repositorio __first\_repo__ tiene algún remoto? ¿Cómo
hacemos para ver los remotos? **Ayuda:** mirá el subcomando
**remote**.

15. Ahora queremos guardar el repositorio en github: subilo a github!
**Ayuda:** Creá el repositorio en github y github te va a ayudar con
los pasos a seguir.

16. ¿Qué hace el subcomando **push**?

17. ¿Qué hace el subcomando **pull**?

18. ¿Qué hace el subcomando **fetch**?

TTPS Opción Ruby

