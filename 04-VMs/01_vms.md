!SLIDE center transition=uncover
# Ruby VMs

!SLIDE smbullets transition=uncover
# MRI

* Matz' Ruby Implementation
* También llamada CRuby
* Es la implementación de referencia del lenguaje
* Últimas versiones
  * 1.8.7-p374 (No usar!)
  * 1.9.3-p448
  * 2.0.0-p247 (Usar!)

!SLIDE smbullets transition=uncover
# JRuby

* Ruby en la JVM
* Es la alternativa más madura a MRI en términos de compatibilidad con MRI
* Combina lo mejor de la plataforma de la JVM con Ruby:
  * Concurrencia real
  * Interoperabilidad con librerías Java
* Últimas versiones
  * jruby-1.7.4
* Modos
  * 1.8.7
  * 1.9.3 (default)
  * 2.0.0 (experimental)

!SLIDE smbullets transition=uncover
# Rubinius

* Ruby escrito en (mayoritariamente) Ruby
* La VM fue escrita en C++
* El bytecode compiler y una gran parte de las clases Core de Ruby fueron escritas en Ruby
* Últimas versiones
  * rbx-1.2.4: modos 1.8.7 y 1.9.3
  * rbx-2.0.0 (no lanzado): modos 1.8.7, 1.9.3 y 2.0.0

!SLIDE smbullets transition=uncover
# Otras implementaciones

* IronRuby
  * Ruby en .NET
  * El proyecto está inactivo
* MacRuby
  * Ruby (1.9.3) implementado sobre las tecnologías de Mac OS X (Objective-C)
  * El proyecto no está tan activo
* MagLev: 
  * Ruby en la VM GemStone/S 3.1 de VMware (Smalltalk!)

!SLIDE smbullets transition=uncover
# MRI: Referencias

* [http://ruby-lang.org](http://ruby-lang.org)
* [https://github.com/ruby/ruby](https://github.com/ruby/ruby)

!SLIDE smbullets transition=uncover
# JRuby: Referencias

* [http://jruby.org/](http://jruby.org/)
* [https://github.com/jruby/jruby](https://github.com/jruby/jruby)

!SLIDE smbullets transition=uncover
# Rubinius: Referencias

* [http://rubini.us/](http://rubini.us/)
* [https://github.com/rubinius/rubinius](https://github.com/rubinius/rubinius)

!SLIDE smbullets transition=uncover
# Otras implementaciones: referencias

* [http://ironruby.codeplex.com/](http://ironruby.codeplex.com/)
* [https://github.com/ironlanguages/main](https://github.com/ironlanguages/main)
* [http://macruby.org/](http://macruby.org/)
* [https://github.com/MacRuby/MacRuby](https://github.com/MacRuby/MacRuby)
* [http://maglev.github.io/](http://maglev.github.io/)
* [https://github.com/MagLev/maglev](https://github.com/MagLev/maglev)
