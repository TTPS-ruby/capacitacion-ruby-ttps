!SLIDE bullets transition=uncover smaller
# Las Gemas de Rails
* Rails en sí es una gema que, de hecho, requiere un conjunto de otras gemas
  * Esto puede verse en
    [Rubygems](https://rubygems.org/gems/rails)
* Las gemas en que depende rails son:
  * [actionmailer](https://github.com/rails/rails/tree/master/actionmailer) - framework para envío de email y testing
  * [actionpack](https://github.com/rails/rails/tree/master/actionpack) - framework para el ruteo y respuestas a requerimientos WEB. *Es el VC de MVC*
  * [actionview](https://github.com/rails/rails/tree/master/actionview) - framework para el manejo de templates y renderizado. *Es el V de MVC*
  * [activerecord](https://github.com/rails/rails/tree/master/activerecord) - framework para la conexión a bases de datos. *Es el M de MVC*
  * [activeresource](https://github.com/rails/activeresource) - framework para la abstracción de servicios REST. *Es el M' de MVC*
  * [activesupport](https://github.com/rails/rails/tree/master/activesupport) - extensiones a Ruby y clases que proveen mayor funcionalidad
  * [bundler](http://gembundler.com/) - Manejo de gemas
  * [railties](https://github.com/rails/rails/tree/master/railties) - comandos de consola y generadores

Estas gemas a su vez tienen dependencias, dando un total de aproximadamente 44
gemas

!SLIDE bullets transition=uncover small
# Más gemas
* Además de la gema de rails, el comando `rails new` agrega otras gemas:
  * [sqlite3](https://github.com/luislavena/sqlite3-ruby) - adaptador para bases de datos SQLite
  * [sass-rails](https://github.com/rails/sass-rails) - habilita el uso de sintaxis SCSS para los estilos
  * [uglifier](https://github.com/lautis/uglifier) - compresor de JavaScript
  * [coffee-rails](https://github.com/rails/coffee-rails) - habilita el uso de sintaxis CoffeeScript para JavaScript
  * [jquery-rails](https://github.com/rails/jquery-rails) - agrega la librería JavaScript jQuery 
  * [turbolinks](https://github.com/rails/turbolinks) - técnica que acelera la carga de páginas web
  * [jbuilder](https://github.com/rails/jbuilder) - utilidad para la codificacion de datos en JSON

Puede que no se utilice ni SQLite, SCSS, jQuery u otras gemas, pero la mayoría
de los desarrollos las utilizan y por ello se consideran

!SLIDE bullets transition=uncover smaller
# Algunas gemas útiles
* De propósito general
  * [activerecord-tableless](https://github.com/softace/activerecord-tableless) - permite usar modelos de Rails sin bases de datos
  * [high_voltage](https://github.com/thoughtbot/high_voltage) - Para la creación de páginas estáticas como *about*
  * [figaro](https://github.com/laserlemon/figaro) - Para la configuracion del
    proyecto
  * [simple_form](https://github.com/plataformatec/simple_form) - simplifica el uso de forms
* Para mejorar el estilo visual
  * [compass-rails](https://github.com/Compass/compass-rails) - simplifica el manejo de estilos para poder usar [Zurb Fundation](http://foundation.zurb.com/) por ejemplo
  * [zurb-foundation](https://github.com/zurb/foundation) - front-end framework
* Para simplificar la labor de desarrollo
  * [better_errors](https://github.com/charliesome/better_errors) - simplifica
    la búsqueda de errores
  * [quiet_assets](https://github.com/evrone/quiet_assets) - elimina mensajes
    que distraen en los logs
  * [rails_layout](https://github.com/RailsApps/rails_layout) - genera archivos para el layout de la aplicación usando Twitter Bootstrap o Zurb Fundation
