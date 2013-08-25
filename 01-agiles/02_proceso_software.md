!SLIDE center transition=uncover
# Introducción al proceso del software
!SLIDE bullets transition=uncover
# Mejora de los procesos de producción
* Todo proyecto necesita ser ejecutado y entregado bajo ciertas restricciones
* Estas restricciones son:
  * Alcance
  * Plazo
  * Costo
!SLIDE bullets transition=uncover
# Mejora de los procesos de producción
![triangulo](triangulo-gestion-proyectos.png)

* Triángulo de la Gestión de Proyectos
  * Cada lado del triángulo representa una restricción
  * Un lado no podrá ser modificado sin impactar a los otros

!SLIDE bullets incremental transition=uncover
# ¿Qué es lo que queremos conseguir?
* Mayor **productividad**
  * *Relación entre los resultados y el tiempo utilizado para obtenerlos*
* Mayor **calidad**
  * *Que el producto final satisfaga las necesidades del usuario*

!SLIDE bullets incremental transition=uncover
# Ámbitos de mejora en Ingeniería de software
* **Notación:** lenguajes
* **Herramientas:** IDEs, frameworks
* **Procesos:** *metodologías*

!SLIDE bullets transition=uncover
# Un modelo de proceso a *medida*
* <span class="letter_box" style="background-color: yellow">P</span> Planificación
* <span class="letter_box" style="background-color: #FFCC33">R</span> Requisitos
* <span class="letter_box" style="background-color: #FF3366">D</span>
  Arquitectura y diseño
* <span class="letter_box" style="background-color: #CCCCFF">C</span>
  Codificación (programación)
* <span class="letter_box" style="background-color: #66FF99">T</span> Testeo de
  aceptación
* <span class="letter_box" style="background-color: #B0B0B0">D</span> Despliegue
  (deployment)
!SLIDE transition=uncover
# Proceso secuencial
## En este ejemplo no hay solapamiento
![proceso secuencial](01-proceso-secuencial.png)

!SLIDE transition=uncover
# Proceso en cascada
## Es mejor solapar trabajo
![proceso en cascada](02-proceso-cascada.png)

!SLIDE transition=uncover
# Proceso incremental
![proceso incremental](03-proceso-incremental.png)

!SLIDE transition=uncover
# Proceso incremental 
## Mejor hacer *todo* incremental
![proceso incremental](04-proceso-incremental-completo.png)

*Pero... ¿Cómo planificar sin saber qué hacer?*

!SLIDE transition=uncover
# Proceso incremental con fase de exploración
![proceso incremental](05-proceso-incremental-exploracion.png)

*¿Si deseamos obtener validaciones frecuentes con el cliente?*

!SLIDE transition=uncover
# Proceso iterativo e incremental
![proceso incremental](06-proceso-iterativo-incremental.png)
*¿Y con pruebas de regresión entre iteraciones?*

!SLIDE center transition=uncover
![proceso incremental](07-proceso-iterativo-incremental-regresion.png)

!SLIDE bullets transition=uncover
# Modelos de proceso y metodologías
* Aportan disciplina a la Ingeniería de Software
* Un modelo de proceso es una estrategia *global* respecto de cómo
  abordar un proyecto
* Una **metodología** define **Quién** debe hacer **Qué**, **Cuándo** y **Cómo**
  debe hacerlo
  * Metodologías tradicionales
  * Metodologías ágiles

!SLIDE center transition=uncover
# Actividad
## The Hard Choice Game
.notes Se requieren unos 40 minutos para realizar la actividad. Se trata de una
sencilla e interesante actividad para ilustrar el concepto de Deuda Técnica.
Pero más allá de dicho propósito, esta actividad permite motivar al inicio de un curso, 
lo diferente que es una estrategia de trabajo en equipo respecto de una estrategia 
de trabajo individual. Ver más en https://github.com/TTPS-ruby/capacitacion-ruby-ttps/blob/master/actividades/01-agiles/hard_choices.md

!SLIDE smbullets small transition=uncover
# Sobre el juego
## Reglas básicas
* Armar grupos de no más de 5 personas y no menos de 2
* Cada persona utilizará una ficha y lanzará en turnos el los dados
* Arrancará el jugador que lance el número más alto
* Los turnos son en sentido horario
* Al llegar a la meta:
  * El primer jugador en llegar obtiene **5 puntos**
  * El segundo **2 puntos**
  * El tercero **1 punto**
* El juego termina cuando hayan llegado tres jugadores a la meta, el resto **no
cuenta**
* No es necesario caer exactamente en la celda de la meta para finalizar

!SLIDE smbullets small transition=uncover
# Sobre el juego
## Puntuación
* Cuando se cae en una celda de herramienta se **recoge una tarjeta de
  herramienta**
  * *Las tarjetas de herramienta darán un punto adicional en el cómputo del
  jugador*
* Cuando se cae o pasa por un puente se recoge una tarjeta de puente. 
  * *Las tarjetas de puente restarán un punto en el cómputo del jugador*
* Un jugador en su turno puede **cambiar de dirección**, es decir, puede volver
  hacia atrás para intentar caer en una celda de herramienta *luego de haber
lanzado los dados*
* Caer sobre la ficha de otro jugador le devuelve al inicio :-)

!SLIDE center transition=uncover
# Empieza el juego
## Ronda 1

!SLIDE center transition=uncover
# Nueva jugada
## Ronda 2: cambian las reglas

!SLIDE bullets transition=uncover
# Nuevas reglas
* Solo jugamos por 6 minutos
* Ajustamos el
  [cronómetro](http://www.online-stopwatch.com/full-screen-stopwatch/)

!SLIDE bullets incremental transition=uncover
# Conclusiones
* ¿Qué estrategias utilizaron?
* ¿Como fué el comportamiento de los participantes en cada tablero?
  * **Ronda 1:** relajación, apatía y egoísmo. La argentinidad al palo...
  * **Ronda 2:** tensión, colaboración e incluso sacrificio si alguien dejó de 
  jugar

!SLIDE smbullets incremental small transition=uncover
# Comparamos con un proyecto de software
* El tiempo establecido es el plazo del proyecto.
  * Hay muchas formas de llegar a la meta
* Recoger herramientas es aplicar buenas prácticas de ingeniería de software
* Utilizar puentes o atajos es saltarse dichas buenas prácticas 
  * No esforzarse por conseguir una arquitectura ideal
* ***Sin embargo, para el éxito del proyecto puede que no sea tan determinante una
buena arquitectura respecto de entregar un producto que cumple con las expectativas
del cliente y en el plazo oportuno***
  * *No se puede estar eternamente eligiendo herramientas*
  * *Tampoco tiene sentido llegar a la meta con un producto muy pobre en arquitectura lo cual
puede ocasionar problemas en el posterior mantenimiento*
