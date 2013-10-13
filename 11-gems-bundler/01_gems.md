!SLIDE center transition=uncover
# Gem

!SLIDE bullets small transition=uncover
# Introducción

* Una gema es un formato simple para publicar y compartir código Ruby.
* Cada gema tiene un nombre, versión y plataforma.

!SLIDE bullets small transition=uncover
# Comandos básicos

* Instalar una gema: `gem install rake`
* Buscar una gema: `gem search sinatra`
* Listar gemas instaladas: `gem list`

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
* Actualizar dependencias a sus últimas versiones: `bundle install`
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

## Ejemplo
	@@@ ruby
	source 'https://rubygems.org'
    gem 'sinatra', github: 'sinatra/sinatra'
    gem 'activerecord', '~> 3.1.0'

!SLIDE bullets small transition=uncover
# Usando bundler

* Con declarar las dependencias en el `Gemfile` no basta, hay que invocar a bundler.
* Hay dos formas:

## Dejar que bundler se encargue de requerir los archivos
	@@@ ruby
	require 'bundler'
    Bundler.require

## Que bundler arme el entorno y nosotros requerimos los archivos
	@@@ ruby
	require 'bundler'
    Bundler.setup
    require 'sinatra'