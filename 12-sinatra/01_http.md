!SLIDE center transition=uncover
# HTTP

!SLIDE bullets small transition=uncover
# Introducción

* Es un protocolo de red de la capa de aplicación
* Es la espina dorsal de la comunicación entre clientes y servidores
* Cuando un cliente (un browser, una aplicación web, un servicio) quiere
interactuar con un servidor sobre HTTP le envía un mensaje (**Request**)
* Luego, cuando el servidor termina de procesar el Request puede comunicar
información al cliente creando un mensaje HTTP propio (**Response**).

!SLIDE bullets small transition=uncover
# Introducción (continuación)

* El **Response** usualmente contiene la siguiente información:
  * **status**: si el **Request** del cliente fue exitoso, si ocurrió un
  error, etc.
  * **headers**: por ejemplo que tipo de contenido se envía al cliente, etc.
  * **body**: por ejemplo, un documento HTML

!SLIDE bullets small transition=uncover
# Mensaje HTTP

Un mensaje HTTP se compone por:

* **Start line**: Es la primera línea del Request. Identifica el
**Verbo HTTP**, a que recurso acceder y denota la versión de HTTP a usar.
* **Headers**: Proveen información adicional acerca del Request. Ejemplos de
headers son: los valores de las cookies para el dominio, el tipo de contenido
a aceptar, etc.
* **Message Body**: Puede contener datos binarios o de texto. Por ejemplo,
cuando se sube una imagen a facebook, los datos binarios de la foto son
enviados en este campo. Este campo no es obligatorio.

!SLIDE bullets small transition=uncover
# Verbos HTTP

* **GET**: se usa para pedirle al servidor web la representación de un
recurso.
* **POST**: se usa para enviar datos a un servidor web.
* **PUT**: se usa para crear o actualizar la representación de un recurso en
un servidor web.
* **DELETE**: se usa para destruir un recurso en un servidor web.
* **PATCH**: se usa para actualizar una parte de un recurso.
* La especificación de HTTP también define **OPTIONS**, **HEAD**, **TRACE** y
**CONNECT**, los cuales dejaremos de lado.
