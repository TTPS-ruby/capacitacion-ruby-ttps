!SLIDE center transition=uncover
# Bundler

!SLIDE bullets small transition=uncover
# Introducción

* Mantiene un entorno consistente para las aplicaciones ruby
* Asegura que la aplicación que lo use tenga las dependencias necesarias
para que se ejecute sin errores.
* Bundler es una gema: `gem install bundler`

!SLIDE bullets small transition=uncover
# Ejemplo

## Definimos las dependencias en el archivo `Gemfile`
	@@@ ruby
	source 'https://rubygems.org'

    gem 'sinatra'

## Luego instalamos las dependencias con `bundle install` o simplemente `bundle`

!SLIDE bullets small transition=uncover
# Comandos

* Instalar dependencias: `bundle install`
* Actualizar dependencias a sus últimas versiones: `bundle update`
* Ejecutar un script en el contexto del bundle actual: `bundle exec`
* Ver las gemas instaladas en el bundle actual: `bundle list`
* Ver donde está ubicada una gema: `bundle show NOMBRE_GEMA`

!SLIDE bullets small transition=uncover
# Gemfile

* Se escribe con una DSL propia de bundler (extraida de Rubygems)
* Puede incluir cualquier código ruby!
* La sentencia `gem` indica una dependencia y acepta los siguientes
parámetros:
  * versión, por ejemplo: `'>= 1.1.0'`, `'~> 3.1.2'`
  * github (construir la gema a partir de un repositorio en github): `github: 'sinatra/sinatra'`
  * path: para una gema local

## Ejemplo
	@@@ ruby
	source 'https://rubygems.org'
    gem 'sinatra', github: 'sinatra/sinatra'
    gem 'activerecord', '~> 3.1.0'

!SLIDE bullets small transition=uncover
# Usando bundler

* Con declarar las dependencias en el `Gemfile` no basta, hay que invocar a bundler.
* Hay dos formas:

## Bundler requiere los archivos
	@@@ ruby
	require 'bundler'
    Bundler.require

## Bundler configura, pero los require son explícitos
	@@@ ruby
	require 'bundler'
    Bundler.setup
    require 'sinatra'

!SLIDE smbullets small transition=uncover
# Con el Gemfile podremos establecer
 
* La fuente de donde obtener las gemas: `source 'https://rubygems.org'`
  * Especificarlo para una gema en particular o agrupar gemas por sources

* Cómo se require la gema: usando `require: 'string'` o
  `require: false`

* Versión de una gema: `>= x.y` o `~> x.y.z`

* Tag, branch o ref de un repo git

* Grupos de gemas con el fin de poder requerir o instalarlas en forma modular:
  `group: :development`
  * Relacionado con `Bundler.setup` y `Bundler.require`

* Plataforma para la cual aplican determinadas gemas: `patforms:
  [:jruby, :ruby]`

!SLIDE smbullets smaller transition=uncover
# Ejemplo de Gemfile

	@@@ ruby
	source 'https://rubygems.org'

	gem 'thin',  '~>1.1'

	gem 'rspec', :require => 'spec'

	gem 'my_gem', '1.0', :source => 'https://gems.example.com'

	gem 'mysql2', platform: :ruby
	gem 'jdbc-mysql', platform: :jruby
	gem 'activerecord-jdbc-adapter', platform: :jruby

	source 'https://gems.example.com' do
		gem 'another_gem', '1.2.1'
	end

	gem 'nokogiri', 
		:git => 'https://github.com/tenderlove/nokogiri.git', 
		:branch => '1.4'

	gem 'extracted_library', :path => './vendor/extracted_library'

	gem 'wirble', :group => :development
	gem 'debugger', :group => [:development, :test]
	group :test do
		gem 'rspec'
	end


