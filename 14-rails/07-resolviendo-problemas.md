!SLIDE bullets transition=uncover
# Resolviendo problemas

* Veremos algunas técnicas que ayudan a resolver problemas
  * Rails console
  * Rails logger
  * Stack trace
  * Raising exceptions

!SLIDE bullets transition=uncover small
# Rails console
* IRB solamente evalúa expresiones que son definidas por la API de ruby
* IRB no conoce las clases de rails
* Rails console carga toda la aplicación rails en una consola IRB

## Ejemplo
	@@@ bash
	$ bundle exec rails console
	Loading development environment (Rails X.Y.Z)
	irb(main):001:0> 

*Notamos que se cargó el ambiente de development*

!SLIDE bullets transition=uncover
# Rails console
## Inspeccionamos el modelo

	@@@ bash
	irb(main):001:0> owner = Owner.new
	=> #<Owner:0x007f7eccd77e48>

	irb(main):002:0> owner.name
	=> "Foobar Kadigan"

!SLIDE bullets transition=uncover small
# Rails logger
* Las aplicaciones rails envían información de diagnóstico a un *archivo de log*
* Dependiendo del ambiente en el que corre la aplicación, el log será:
	* **log/development.log**
	* **log/production.log**
* En el ambiente de desarrollo, todo log escrito en el archivo es además enviado
  a la consola de donde se corre el comando `rails server`
* Además de los logs por defecto de rails, podemos usar nosotros en **logger**

!SLIDE bullets transition=uncover smaller
# Rails logger
## Modificamos `app/controllers/visitors_controller.rb`
	@@@ ruby
	class VisitorsController < ApplicationController
		def new
			Rails.logger.debug 'DEBUG: entering new method'
			@owner = Owner.new
			Rails.logger.debug "DEBUG: Owner name is #{@owner.name}"
		end
	end

## Ahora la salida en la consola será
	@@@ bash
	Started GET "/" for 127.0.0.1 at ...
	Processing by VisitorsController#new as HTML
	DEBUG: entering new method
	DEBUG: Owner name is Foobar Kadigan
	Rendered visitors/new.html.erb within layouts/application (0.2ms)
	Completed 200 OK in 8ms (Views: 4.6ms | ActiveRecord: 0.0ms)

!SLIDE smbullets transition=uncover 
# Rails logger
* Podemos usar **Rails.logger** en nuestros modelos
* En los controladores, es posible usar el método **logger** directamente
* Es posible usar:
	* `logger.debug`
	* `logger.info`
	* `logger.warn`
	* `logger.error`
	* `logger.fatal`
* En el ambiente de desarrollo todos los logs se mostrarán
* En el ambiente de producción no se visualizarán los logs enviados a
  `logger.debug`

!SLIDE smbullets transition=uncover smaller
# El Stack Trace

* Si bien el logger es muy útil, hay casos en donde el programa se colgará y la
  consola mostrará un *stack trace*
* Provocamos un error agregando en el controlador un error

## Generamos el error

	@@@ ruby
	class VisitorsController < ApplicationController
		def new
			Rails.logger.debug 'DEBUG: entering new method'
			@owner = Owner.new
			Rails.logger.debug 'DEBUG: Owner name is ' + @owner.name
			DISASTER
		end
	end

## Al ingresar a la página veremos
![error stack trace](08-stacktrace.png)

!SLIDE bullets transition=uncover smaller
# El Stack Trace
* La captura muestra el error así porque usamos la gema **better_errors**

## En la consola veremos
	@@@ bash
	Started GET "/" for 127.0.0.1 at 2013-12-08 20:09:18 -0300
	Processing by VisitorsController#new as HTML
	DEBUG: entering new method
	DEBUG: Owner name is Foobar Kadigan
	Completed 500 Internal Server Error in 2ms

	NameError - uninitialized constant VisitorsController::DISASTER:
		activesupport (4.0.1) lib/active_support/dependencies.rb:501:in `load_missing_constant'
		...

!SLIDE smbullets transition=uncover
# El Stack Trace
* No hay que sentirse abrumado por la cantidad de información
* Muchas veces la explicación del problema está en la primer línea
* Otras veces tenemos que avanzar sobre la pila leyendo cuidadosamente el
  problema

!SLIDE smbullets transition=uncover small
# Lanzando excepciones
* El ejemplo del stack trace hace uso de una directiva desconocida por rails
* Una solución más elegante sería lanzar una excepción

## Ejemplo

	@@@ ruby
	class VisitorsController < ApplicationController
	def new
		Rails.logger.debug 'DEBUG: entering new method'
			@owner = Owner.new
			Rails.logger.debug ".."
			raise 'Deliberate Failure'
		end
	end

## Más recursos...
[RailsGuide: Debugging Rails Applications](http://guides.rubyonrails.org/debugging_rails_applications.html)
