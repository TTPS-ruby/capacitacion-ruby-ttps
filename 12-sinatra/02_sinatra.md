!SLIDE center transition=uncover
# Sinatra

!SLIDE bullets small transition=uncover
# Introducción

* Es una DSL para desarrollar aplicaciones y web services en Ruby basado en
**Rack** (Recordar este término, lo nombraremos mucho de aquí en adelante)
* Hace énfasis en el desarrollo minimalista, ofreciendo sólo lo que es
esencial para manejar Requests HTTP y entregar Responses a los clientes.
* Tiene una sintaxis simple
* No es un framework:
  * No tiene un ORM
  * No tiene archivos de configuración
  * No hay estructura de archivos
* No fuerza a implementar MVC ni ningún otro patrón

!SLIDE bullets small transition=uncover
# Ejemplo

* Creamos un directorio e inicializamos con `bundle init`

## El Gemfile

	@@@ ruby
	source 'https://rubygems.org'
	gem 'sinatra'

## El server

	@@@ ruby
	require 'sinatra'

    get '/' do
      'hello world'
    end

!SLIDE commandline small transition=uncover
# Probamos el server

* Asumiendo el server se guarda en el archivo `server.rb`
  * Lo ejecutamos: `ruby server.rb`

## Probamos con curl

	$ curl -v http://localhost:4567/
	> GET / HTTP/1.1
	> User-Agent: curl/7.35.0
	> Host: localhost:4567
	> Accept: */*
	> 
	< HTTP/1.1 200 OK 
	HTTP/1.1 200 OK 
	< Content-Type: text/html;charset=utf-8
	Content-Type: text/html;charset=utf-8
	< Content-Length: 11
	Content-Length: 11
	< X-Xss-Protection: 1; mode=block
	X-Xss-Protection: 1; mode=block
	< X-Content-Type-Options: nosniff
	X-Content-Type-Options: nosniff
	< X-Frame-Options: SAMEORIGIN
	X-Frame-Options: SAMEORIGIN
	* Server WEBrick/1.3.1 (Ruby/2.1.2/2014-05-08) is not blacklisted
	< Server: WEBrick/1.3.1 (Ruby/2.1.2/2014-05-08)
	Server: WEBrick/1.3.1 (Ruby/2.1.2/2014-05-08)
	< Date: Sun, 26 Oct 2014 23:35:04 GMT


!SLIDE bullets small transition=uncover
# Y cómo lo testeamos?

* Para testear aplicaciones sinatra usaremos una gema llamada `rack-test`
* Para testear el ejemplo, haremos un request `GET /` y esperaremos que nos
devuelva un código de estado `200` (OK) y que el body sea `'hello world'`

!SLIDE bullets small transition=uncover
# Y cómo lo testeamos?
	@@@ ruby
	require 'minitest/autorun'
	require 'rack/test'
	require_relative 'server'

	class HelloWorldTest < MiniTest::Test
		include Rack::Test::Methods

		def app
			Sinatra::Application
		end

		def test_get_root
			get '/'
			assert_equal 200, last_response.status
			assert last_response.ok?
			assert_equal 'hello world', last_response.body
		end
	end

!SLIDE bullets small transition=uncover
# Y si queremos usar mintest/spec
	@@@ ruby
	require 'minitest/autorun'
	require 'minitest/spec'
	require 'rack/test'
	require_relative 'server'

	include Rack::Test::Methods

	def app
		Sinatra::Application
	end

	describe 'my example server' do
		it 'should succeed' do
			get '/'
			last_response.status.must_equal 200
			last_response.must_be :ok?
			last_response.body.must_include 'hello world'
		end
	end


!SLIDE bullets small transition=uncover
# Rutas en Sinatra

* En sinatra una ruta es la dupla de un método HTTP, con un patrón de URL
* A cada ruta se le asocia un bloque
* Las rutas se machean en el orden en que fueron definidas
* Los patrones de rutas podrán:
  * Incluir parámetros nombrados: accesibles usando el hash `params` o como un
    parámetro del bloque
  * Utilizar argumentos **splat**: accesibles mediante `params[:splat]` o
    parámtros del bloque
  * Expresiones regulares
  * Incluir parámetros de consulta: `?some_param=value&other=other_value`

!SLIDE bullets small transition=uncover
# Ejemplos de rutas: verbos
	@@@ ruby
	get '/' do
		.. show something ..
	end

	post '/' do
		.. create something ..
	end

	put '/' do
		.. replace something ..
	end

	patch '/' do
		.. modify something ..
	end

	delete '/' do
		.. annihilate something ..
	end

!SLIDE bullets transition=uncover
# Ejemplos de rutas: verbos

	@@@ ruby
	options '/' do
		.. appease something ..
	end

	link '/' do
		.. affiliate something ..
	end

	unlink '/' do
		.. separate something ..
	end

!SLIDE bullets small transition=uncover
# Ejemplos de rutas: patrones con parámetros

	@@@ ruby
	get '/hello/:name' do
		# matches "GET /hello/foo" and "GET /hello/bar"
		# params[:name] is 'foo' or 'bar'
		"Hello #{params[:name]}!"
	end

	# O usando variables de bloque
	get '/hello/:name' do |n|
		# matches "GET /hello/foo" and "GET /hello/bar"
		# params[:name] is 'foo' or 'bar'
		# n stores params[:name]
		"Hello #{n}!"
	end

!SLIDE bullets small transition=uncover
# Ejemplos de rutas: patrones con splats

	@@@ ruby
	get '/say/*/to/*' do
		# matches /say/hello/to/world
		params[:splat] # => ["hello", "world"]
	end

	get '/download/*.*' do
		# matches /download/path/to/file.xml
		params[:splat] # => ["path/to/file", "xml"]
	end

	# O usando variales de bloque
	get '/download/*.*' do |path, ext|
		[path, ext] # => ["path/to/file", "xml"]
	end

!SLIDE bullets small transition=uncover
# Ejemplos de rutas: patrones basados en regexp

	@@@ ruby
	get %r{/hello/([\w]+)} do
		"Hello, #{params[:captures].first}!"
	end

	# O usando variables de bloque
	get %r{/hello/([\w]+)} do |c|
		"Hello, #{c}!"
	end

!SLIDE bullets small transition=uncover
# Ejemplos de rutas: con parámetros de consulta

	@@@ruby
	get '/posts' do
		# matches "GET /posts?title=foo&author=bar"
		title = params[:title]
		author = params[:author]
	end

!SLIDE smbullets transition=uncover
# Sinatra: Condiciones

* Las rutas de sinatra pueden incluir condiciones de match como por ejemplo:
  * `agent`: condiciones sobre el UA
  * `provides`: condiciones sobre el content type
  * `host_name`: condiciones sobre el server name
  * definidas por el usuario

!SLIDE smbullets small transition=uncover
# Ejemplo de Condiciones

	@@@ruby
	get '/foo', :agent => /Songbird (\d\.\d)[\d\/]*?/ do
		"You're using Songbird version #{params[:agent][0]}"
	end

	get '/foo' do
		# Matches non-songbird browsers
	end

## Cómo probar?

`curl -i -v http://localhost:4567 -A 'Songbird 1.1'`

!SLIDE smbullets small transition=uncover
# Ejemplo de condiciones con host_name y provides
	@@@ruby
	get '/', :host_name => /^admin\./ do
		"Admin Area, Access denied!"
	end

	get '/', :provides => 'html' do
		'HTML'
	end

	get '/', :provides => ['rss', 'atom', 'xml'] do
		'XML'
	end

## Cómo probar?

`curl -i -v http://localhost:4567 -H "Accept: application/xml"`

!SLIDE bullets small transition=uncover
# Ejemplo de condiciones propias
	@@@ruby
	set(:probability) do |value| 
		condition { rand <= value }
	end

	get '/win_a_car', :probability => 0.1 do
		"You won!"
	end

	get '/win_a_car' do
		"Sorry, you lost."
	end

!SLIDE bullets smaller transition=uncover
# Ejemplo de condiciones propias
	@@@ruby
	set(:auth) do |*roles|   # <- notice the splat here
		condition do
			unless logged_in? && 
				roles.any? {|role| current_user.in_role? role }
					redirect "/login/", 303
			end
		end
	end

	get "/my/account/", :auth => [:user, :admin] do
		"Your Account Details"
	end

	get "/only/admin/", :auth => :admin do
		"Only admins are allowed here!"
	end


!SLIDE bullets small transition=uncover
# Sinatra: valor de retorno

* El valor de retorno de un bloque de ruta determina al menos el cuerpo de la
respuesta que se le pasa al cliente HTTP o al siguiente middleware en la pila
de Rack.
* Lo más común es que sea un string, como en los ejemplos anteriores.
* Sin embargo, otros valores también son aceptados (no lo veremos ahora)

!SLIDE bullets small transition=uncover
# Sinatra: características

* **Archivos estáticos**: Son servidos desde el directorio `public`
* **Vistas/Plantillas**: Sinatra soporta numerosos template engines, y para
renderizar vistas de cada template engine se expone un método con su mismo
nombre. A estos métodos debe pasársele un símbolo con el nombre de la vista
a utilizar, que debe ser guardado en el directorio `views`

## Ejemplo
	@@@ ruby
    get '/' do
      @name = 'Frank Sinatra'
      erb :index
    end

!SLIDE bullets small transition=uncover
# Sinatra: características (continuación)
	@@@ html
    <html>
      <head>
        <title>Welcome</title>
      </head>
      <body>
        Hello, <%= @name %>!
      </body>
    </html>

!SLIDE bullets small transition=uncover
# Sinatra: características (continuación)

* **Filtros**: Los filtros `before` son evaluados antes de cada petición
dentro del mismo contexto que las rutas. Pueden modificar la petición y la
respuesta. Las variables de instancia asignadas en los filtros son accesibles
por las rutas y las plantillas (idem con `after`):

## Ejemplo
	@@@ ruby
    before do
      @nota = 'Hey!'
    end

    get '/' do
      @nota #=> 'Hey!'
    end

!SLIDE bullets small transition=uncover
# Sinatra: características (continuación)

* **Helpers**: Son métodos que pueden ser usados en los bloques de rutas y los
templates.

## Ejemplo
	@@@ ruby
    helpers do
      def bar(name)
        "#{name}bar"
      end
    end

    get '/:name' do
      "#{bar params[:name]}"
    end

!SLIDE bullets small transition=uncover
# Sinatra: características (continuación)

* **Sessions**: Una sesión es usada para mantener el estado a través de
distintas peticiones. Cuando están activadas, proporciona un hash de sesión
para cada sesión de usuario:

## Ejemplo
	@@@ ruby
    enable :sessions

    get '/' do
      "value = " << session[:value].inspect
    end

    get '/:value' do
      session[:value] = params[:value]
    end

!SLIDE bullets small transition=uncover
# Sinatra: características (continuación)

* **Redirecciones del navegador**: Podés redireccionar al navegador con el
método redirect:

## Ejemplo
	@@@ ruby
    get '/foo' do
      redirect to('/bar')
    end

    get '/bar' do
      'Hello!'
    end

!SLIDE bullets small transition=uncover
# Sinatra: características (continuación)

* **Manejo de errores**: Los manejadores de errores se ejecutan dentro del
mismo contexto que las rutas y los filtros before, lo que significa que podés
usar, por ejemplo, haml, erb, halt, etc.

## Ejemplo
	@@@ ruby
    not_found do
      'Ruta no encontrada'
    end

    error do
      'Disculpá, ocurrió un error horrible - ' +
        env['sinatra.error'].name
    end
