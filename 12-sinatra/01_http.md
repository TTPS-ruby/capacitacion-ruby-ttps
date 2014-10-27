!SLIDE center transition=uncover
# HTTP

!SLIDE bullets small transition=uncover
# Introducción

* Es un protocolo de red de la capa de aplicación
* Se ha convertido en el principal protocolo de comunicación entre clientes y servidores
* Cuando un cliente (un browser, una aplicación web, un servicio) quiere
interactuar con un servidor sobre HTTP le envía un mensaje (**Request**)
* Luego, cuando el servidor termina de procesar el Request puede comunicar
información al cliente creando un mensaje HTTP propio (**Response**).

!SLIDE bullets small transition=uncover
# Requerimiento HTTP

* **Start line**: Es la primera línea del Request. Identifica el
**Verbo HTTP**, a que recurso acceder y denota la versión de HTTP a usar.
* **Headers**: Proveen información adicional acerca del Request. Ejemplos de
headers son: los valores de las cookies para el dominio, el tipo de contenido
a aceptar, etc.
* **Message Body**: Puede contener datos binarios o de texto. Por ejemplo,
cuando se sube una imagen a facebook, los datos binarios de la foto son
enviados en este campo. Este campo no es obligatorio.

!SLIDE command small transition=uncover
# Ejemplo de requerimiento HTTP

	GET /capacitacion-ruby-ttps/ HTTP/1.1

	Host: ttps-ruby.github.io

	Connection: keep-alive

	Pragma: no-cache

	Cache-Control: no-cache

	Accept: text/html,application/xhtml+xml,\
	        application/xml;q=0.9,image/webp,*/*;q=0.8

	User-Agent: Mozilla/5.0 (X11; Linux x86_64)\ 
	            AppleWebKit/537.36 (KHTML, like \
	            Gecko) Chrome/38.0.2125.104 Safari/537.36

	Accept-Encoding: gzip,deflate,sdch

	Accept-Language: es-ES,es;q=0.8


!SLIDE bullets small transition=uncover
# Respuesta HTTP

* El **Response** usualmente contiene la siguiente información:
  * **status**: si el **Request** del cliente fue exitoso, si ocurrió un
  error, etc.
  * **headers**: por ejemplo que tipo de contenido se envía al cliente, etc.
  * **body**: por ejemplo, un documento HTML

!SLIDE command small transition=uncover
# Ejemplo de respuesta HTTP

	HTTP/1.1 200 OK

	Server: GitHub.com

	Content-Type: text/html; charset=utf-8

	Last-Modified: Tue, 21 Oct 2014 02:06:17 GMT

	Expires: Sun, 26 Oct 2014 23:05:15 GMT

	Cache-Control: max-age=600

	Content-Encoding: gzip

	Content-Length: 78296

	Accept-Ranges: bytes

	Date: Sun, 26 Oct 2014 22:55:48 GMT


	...........{..W.....UT.>.....$`...C.r ....L&.?.T.
	...gN...k_......=.{../.g'..~.../.>..V......[_...Q

!SLIDE smbullets transition=uncover
# Un poco de historia de HTTP

* Protocolo usado para la WWW.
* RFC 2616: http://www.ietf.org/rfc/rfc2616.txt
* Lanzado en el año 1999
* Protocolo sin estado (Stateless)
* El acceso a los recursos se hace por medio
de métodos:
  * HTTP 1.0: GET, HEAD, POST
  * HTTP 1.1: agrega PUT, DELETE, OPTIONS, TRACE, CONNECT

!SLIDE smbullets transition=uncover
# Algunos detalles del protocolo

* Los métodos GET, HEAD, PUT, DELETE son considerados idempotentes: 
  * El resultado de invocar el método es el mismo que hacerlo N
veces (N > 1)
* Lo mismo aplica para OPTIONS y TRACE dado que no deberían tener efectos
secundarios, y por ende heredan la propiedad

!SLIDE smbullets transition=uncover
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

!SLIDE commandline small transition=uncover
# El mejor amigo de HTTP: curl

Curl y libcurl es una librería empleada para interactuar con varios protocolos,
especialmente HTTP. Si deseamos analizar cabeceras HTTP en implementaciones de
servicios WEB o verificar sitios, podemos utilizar esta herramienta. 

##Un ejemplo de uso:

	$ curl -X GET \
		http://ttps-ruby.github.io/capacitacion-ruby-ttps/ -i
	HTTP/1.1 200 OK
	Server: GitHub.com
	Content-Type: text/html; charset=utf-8
	Last-Modified: Tue, 21 Oct 2014 02:06:17 GMT
	Expires: Sun, 26 Oct 2014 23:36:24 GMT
	Cache-Control: max-age=600
	Content-Length: 281844
	Accept-Ranges: bytes
	Date: Sun, 26 Oct 2014 23:26:24 GMT
	Via: 1.1 varnish
	Age: 0
	Connection: keep-alive
	X-Served-By: cache-iad2134-IAD
	X-Cache: MISS
	X-Cache-Hits: 0
	X-Timer: S1414365984.304589,VS0,VE7
	Vary: Accept-Encoding
	
	<...
