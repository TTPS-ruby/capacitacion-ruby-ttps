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
	@@@ ruby
	require 'sinatra'

    get '/' do
      'hello world'
    end

## Guardamos el archivo como `server.rb` y luego lo ejecutamos (`ruby server.rb`)

## Probemoslo con curl!

!SLIDE bullets small transition=uncover
# Y como lo testeamos?

* Para testear aplicaciones sinatra usaremos una gema llamada `rack-test`
* Para testear el ejemplo, haremos un request `GET /` y esperaremos que nos
devuelva un código de estado `200` (OK), y que el body sea `'hello world'`

!SLIDE bullets small transition=uncover
# Y como lo testeamos?
	@@@ ruby
    require 'minitest/autorun'
    require 'rack/test'
    require_relative 'server'

    class HelloWorldTest < Minitest::Test
      include Rack::Test::Methods

      def app
        Sinatra::Application
      end

      def test_get_root
        get '/'
        assert_equal 200, last_response.status
        assert_equal 'hello world', last_response.body
      end
    end

!SLIDE bullets small transition=uncover
# Sinatra: rutas con parámetros

* En sinatra, las rutas pueden también aceptar parámetros variables que son
expuestos al código en la variable params.

## Ejemplo
	@@@ ruby
    require 'sinatra'

    get '/hello/:name' do
      # todo lo que venga en el query string será capturado en params, por ejemplo:
      # '/hello/Patricio?username=patricio
      "Hello #{params[:name]}"
    end

!SLIDE bullets small transition=uncover
# Sinatra: valor de retorno

El valor de retorno de un bloque de ruta determina al menos el cuerpo de la
respuesta que se le pasa al cliente HTTP o al siguiente middleware en la pila
de Rack. Lo más común es que sea un string, como en los ejemplos anteriores.
Sin embargo, otros valores también son aceptados.

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
      erb :index
    end

!SLIDE bullets small transition=uncover
# Sinatra: características (continuación)

* **Filtros**: Los filtros `before` son evaluados antes de cada petición
dentro del mismo contexto que las rutas. Pueden modificar la petición y la
respuesta. Las variables de instancia asignadas en los filtros son accesibles
por las rutas y las plantillas (Idem con `after`):

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

* **Manejo de errores**: Los manejadores de errores se ejecutan dentro del
mismo contexto que las rutas y los filtros before, lo que significa que podés
usar, por ejemplo, haml, erb, halt, etc.

## Ejemplo
	@@@ ruby
    not_found do
      'Ruta no encontrada'
    end

    error do
      'Disculpá, ocurrió un error horrible - ' + env['sinatra.error'].name
    end
