!SLIDE center transition=uncover
![Rails](rails_logo.png)
# Rails
!SLIDE bullets transition=uncover
# Cómo funciona la web
* Contenidos: HTML, imagenes, CSS, JS
* Contenidos estáticos
* Contenidos dinámicos
  * Porque se conecta a una DB / Servicio (Facebook)
  * Para simplificar el armado de un HTML modularizando el armado (partials)

!SLIDE smbullets transition=uncover
# Qué es rails
* Conjunto de estructuras y convenciones
* Es una librería o conjunto de gemas
* Al usar rails,  estaremos usando prácticas estandar que simplificarán la
  colaboración y el mantenimiento del código
* Promueve [Separation of Concerns (SoC)](http://en.wikipedia.org/wiki/Separation_of_concerns), lo cual permite obtener programas modulares y mantenibles
* El principal patrón de diseño que implementa es MVC

!SLIDE smbullets transition=uncover
# Stacks

Un stack es un conjunto de tecnologías o librerías utilizadas para desarrollar
una aplicación o para servir una página

## Ejemplos de stack 

* Facebook usa algo como:
  * Linux (operating system)
  * Apache (web server)
  * MySQL (database)
  * PHP (programming language)
* Para el desarrollo con rails generalmente es:
  * Mac OS X, Linux, or Windows
  * WEBrick (web server)
  * SQLite (database)
  * Ruby on Rails (language and framework)

!SLIDE bullets transition=uncover
# Componentes y alternativas
* Un clásico stack de rails será:
  * ERB for view templates
  * MySQL for databases
  * MiniTest for testing
* Una alternativa:
  * Haml for view templates
  * PostgreSQL for databases
  * Rspec for testing

Las componentes podrán intercambiarse fácilmente, habiendo múltiples
alternativas. Seguir las tendencias o componentes populares es una buena
elección

!SLIDE smbullets small transition=uncover
# Ayuda
## ¿Cómo obtener ayuda?
* Google: pero considerar resultados actuales
* [Stack Overflow](http://stackoverflow.com/questions/tagged/ruby-on-rails)
* [Rails Guides](http://guides.rubyonrails.org/)
* [Rails Documentation](http://api.rubyonrails.org/)
* [Rails Begginer Chat
  Sheet](http://pragtob.github.io/rails-beginner-cheatsheet/index.html)
* [Railscasts](http://railscasts.com/)

## Mantenerse actualizado

* [Ruby Weekly](http://rubyweekly.com/)
* [Ruby Flow](http://www.rubyflow.com/)
* [Ruby5](http://ruby5.envylabs.com/)
* [The Changelog](http://thechangelog.com/tagged/rubyonrails/)

!SLIDE commandline incremental transition=uncover
# Instalando
	$ gem install rails
	Successfully installed rails-x.y.z
	
	$ rails -v
	Rails x.y.z


!SLIDE commandline smaller transition=uncover
# Exploramos el comando `rails new`
* Es importante saber que disponemos de mensajes de ayuda para cada comando
  rails
* Rails provee el comando `rails new` para crear una aplicación Rails básica

## Veamos la ayuda disponible para `rails new`:

	$ rails new --help

* La ayuda puede parecer un tanto críptica a primera vista, pero es importante
leer las opciones para ver qué alternativas tenemos.
* No usaremos ninguna opción en esta primer instancia
* Como resultado de la ejecución, se creará un directorio con carpetas y
  archivos en ella.

!SLIDE commandline transition=uncover
# Creamos nuestra primer aplicación

Primero creamos nuestra aplicación

	$ rails new learn-rails

El parámetro **learn-rails** indica el nombre del proyecto. Puede usarse
cualquier nombre

Se instalarán varias gemas nuevas usando `bundler`

	$ cd learn-rails

!SLIDE commandline transition=uncover
# Probando la nueva aplicación

Con los pasos anteriores hemos creado una aplicación simple con valores por
defecto que ya puede usarse

## Iniciando el servidor web

Es posible iniciar la aplicación usando `rails server` o `rails s`

	$ bundle exec rails s
	... Could not find a JavaScript runtime....
	

Para solucionar este error debe instalarse **nodejs** o agregar la gema
**therubyracer** al `Gemfile` (notar que ya está pero comentada)

!SLIDE commandline small transition=uncover
# Iniciando el web server

	$ bundle exec rails s
	=> Booting WEBrick
	=> Rails 4.0.1 application starting in development on http://0.0.0.0:3000
	=> Run `rails server -h` for more startup options
	=> Ctrl-C to shutdown server
	[2013-11-30 19:41:53] INFO  WEBrick 1.3.1
	[2013-11-30 19:41:53] INFO  ruby 2.0.0 (2013-06-27) [x86_64-linux]
	[2013-11-30 19:41:53] INFO  WEBrick::HTTPServer#start: pid=15338 port=3000

* Visualizamos la aplicación accediendo a [http://localhost:3000](http://localhost:3000)
* Observar que al usar el navegador, la consola donde se inició el web server
  se actualiza con información
	* Estos mismos mensajes se van almacenando en `log/development.log`

!SLIDE bullets transition=uncover
# Parando el web server
* El web server puede pararse con **Control+C**
* No es necesario reiniciar el servidor en caso de modificar el proyecto
* Los casos que requiere reiniciar son: 
	* Cuando se cambia el `Gemfile`
	* Al cambiar archivos de configuración 

