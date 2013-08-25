# Hard Choices

## Introducción

Este juego es una adaptación del juego original Hard Choices descripto en:
http://www.sei.cmu.edu/architecture/tools/hardchoices/

## Materiales

* El tablero que puede descargarse [aqui](HardChoices.pdf)
* En cada tablero podrán jugar 4-5 personas. Prever suficientes tableros según la
cantidad de participantes. Imprimir los tableros de juego. Recortar las tarjetas
de herramientas y puentes.

* Conseguir 2 dados y 5 fichas para los jugadores, todo ello para cada tablero.
Asegurarse que los participantes en cada tablero podrán disponer de una mesa
alrededor de la cual sentarse para jugar.


## Reglas:

Establecer grupos de 4-5 jugadores en cada tablero. Proporcionarles dos dados,
fichas y tarjetas de herramientas y puentes. Explicar brevemente las siguientes
reglas del juego, SIN detallar el objetivo.

* El primero en llegar a la meta obtiene 5 puntos, el segundo 2 y el tercero 1.
* El juego termina cuando hayan llegado tres jugadores a la meta, el resto NO
cuenta.
* No es necesario caer exactamente en la celda de la meta.
* Cuando se cae en una celda de herramienta se recoge una tarjeta de herramienta.
* Las tarjetas de herramienta darán un punto adicional en el cómputo del jugador.
* Cuando se cae o pasa por un puente se coge una tarjeta de puente. Las tarjetas
de puente restarán un punto en el cómputo del jugador.
* Un jugador en su turno puede cambiar de dirección, es decir, puede devolverse
(para intentar caer en una celda de herramienta).
* Caer sobre la ficha de otro jugador le devuelve al inicio :-).

## Primera Ronda

* No poner tiempo límite pero ir “presionando” a los equipos más rezagados.
* Al terminar pedir a los jugadores que obtengan su puntaje sumando los puntos por
llegar a la meta con los puntos de tarjetas de herramientas y restando los
puntos de puentes. 
* A continuación preguntar en general quién ha ganado. 
  * Lo normal es que levante la mano el jugador que tiene más puntos en cada equipo. 
  * Hacerles saber que la pregunta tenía truco puesto que lo que realmente se quiere 
    saber es qué equipo ha ganado. 
  * Para determinar el equipo ganador los tres que llegaron a meta de cada equipo 
    deben sumar sus puntos. Insistir en que aquellos que no llegaron entre los tres 
    primeros no deben contabilizar sus puntos. 
  * En este momento hay que remarcar que no sospechaban que estaban realizando un 
    trabajo en equipo y compitieron entre ellos mismos, probablemente perjudicando el desempeño del
    equipo. 

## Segunda Ronda

Advertir que en esta ocasión tendrán solo 6 minutos para llegar a la meta,
cumplido el tiempo aunque en un equipo no hayan llegado tres jugadores, se
terminará la partida. 

*Ofrecer un minuto para que cada equipo piense su estrategia para esta segunda
partida, sabiendo ahora que se trata una competición entre equipos.*

*Sugerencia:* utilizar este [cronómetro web](http://www.online-stopwatch.com/full-screen-stopwatch/), 
iniciar una cuenta regresiva de 6 minutos y hacerla visible a todos los equipos.

Solicitar la contabilización de puntos de cada equipo y comparar con los
puntajes obtenidos en la primera ronda (deberían haber mejorado).

## Comentarios Finales

Preguntar por las estrategias seguidas por cada equipo 

Remarcar los tres aspectos que suelen cambiar en la actitud de los jugadores: 

1. En la primera ronda: relajación, apatía y egoísmo
2. En la segunda ronda tensión, colaboración e incluso sacrificio (si alguien dejó de
jugar).

Preguntar por las analogías de este juego con un proyecto de desarrollo de
software: 

* El tiempo establecido es el plazo del proyecto. Hay muchas formas de
llegar a la meta. 
* Recoger herramientas es aplicar buenas prácticas de ingeniería de software, 
* Utilizar puentes o atajos es saltarse dichas buenas prácticas o no esforzarse 
por conseguir una arquitectura ideal. 
* Sin embargo, para el éxito del proyecto puede que no sea tan determinante una 
buena arquitectura respecto de entregar un producto que cumple con las expectativas 
del cliente y en el plazo oportuno. No se puede estar eternamente tomando herramientas, 
pero tampoco tiene sentido llegar a la meta con un producto muy pobre en arquitectura lo cual
puede ocasionar problemas.

## Explicar el concepto de Deuda Técnica. 
Se incurre en Deuda Técnica al entregar un producto que no tiene una arquitectura ideal, lo 
cual podría dificultar sus futuras modificaciones, pruebas y reutilización. Esta deuda nos 
obligará a pagar intereses cada vez que nos veamos enfrentados a cambios en el producto. La deuda
la saldaremos cuando nos decidamos a realizar la refactorización necesaria para mejorar la 
arquitectura. La paradoja es que **ojala tuviésemos ese problema pues podría ser un síntoma 
que el producto ha tenido éxito y nos están pidiendo mejoras**, además, **todo producto 
exitoso requerirá mantenimiento** pues el cliente estará interesado en mejoras, adaptaciones, 
integraciones, etc. 

### Remarcar que: 
* Una estrategia de equipo es diferente a una individual.
* Las condiciones de un proyecto son cambiantes. Cuando el tiempo comienza a apretar 
sube la tensión y hay que tomar decisiones, especialmente si estamos lejos de la meta.

