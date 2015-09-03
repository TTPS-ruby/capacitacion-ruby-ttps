!SLIDE center transition=uncover
# Historia

!SLIDE smbullets transition=uncover
# Muchas implementaciones

## ¿Cual usar?

## ¿Y si necesito o quiero usar más de 1?

!SLIDE smbullets transition=uncover
# Un pequeño paréntesis

## Gemas
## Bundler

!SLIDE smbullets transition=uncover
# RVM

* Ruby Version Manager
* Fue la primera herramienta para instalar, administrar y trabajar con múltiples entornos de Ruby
* Introduce el concepto de gemset
* Modifica el comando `cd` para cambiar de versión de ruby

!SLIDE smbullets transition=uncover
# rbenv

* Ruby environment
* Fue la primera alternativa a RVM y rápidamente se hizo muy popular
* Es más simple que RVM y ya no instala rubies ni usa gemsets
* Se puede agregar funcionalidad con plugins
* Utiliza shims para cambiar de versión de ruby

!SLIDE smbullets transition=uncover
# chruby

* Es el 3ro en discordia
* Es muy minimalista (90 LOC!)
* Sólo cambia $PATH para cambiar de ruby

!SLIDE smbullets transition=uncover
# Instalando rbenv

* Vamos a instalar rbenv con git
* Vamos a instalar los siguientes plugins
  * ruby-build
  * rbenv-update

!SLIDE smbullets small transition=uncover
# Instalando rbenv

* Instalamos rbenv en `~/.rbenv`

```
$ git clone https://github.com/sstephenson/rbenv.git ~/.rbenv
```

* Agregamos `~/.rbenv/bin` a `$PATH`

```
$ echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bash_profile
```

En ubuntu, hacer el `echo` en `.bashrc` en vez de `.bash_profile`

* Agregamos `rbenv init` al shell para habilitar el autocompletado

```
$ echo 'eval "$(rbenv init -)"' >> ~/.bash_profile
```

En ubuntu, hacer el `echo` en `.bashrc` en vez de `.bash_profile`

!SLIDE smbullets transition=uncover
# Instalando rbenv

* Reiniciamos el shell

```
$ exec $SHELL -l
```

!SLIDE smbullets transition=uncover
# Instalando ruby-build

* Clonamos el plugin en el directorio `~/.rbenv/plugins`

```
$ git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
```

!SLIDE smbullets transition=uncover
# Instalando rbenv-update

* Simplifica la actualización de `rbenv` y todos sus plugins
* Clonamos el plugin en el directorio `~/.rbenv/plugins`

```
$ git clone https://github.com/rkh/rbenv-update.git ~/.rbenv/plugins/rbenv-update
```

!SLIDE smbullets transition=uncover
# rbenv: Comandos

* `rbenv versions` muestra las versiones instaladas de ruby (con un * la versión actual)
* `rbenv global` muestra o setea la versión global de ruby

```
$ rbenv global # muestra la versión global
```

```
$ rbenv global 2.0.0-p247 # setea la versión 2.0.0-p247 como global
```

* `rbenv local` identico al comando anterior, pero para el directorio actual

* `rbenv install` instala rubies! (con `-l` listamos todas las versiones disponibles)

!SLIDE smbullets transition=uncover
# Referencias

* [https://rvm.io/](https://rvm.io/)
* [https://github.com/sstephenson/rbenv](https://github.com/sstephenson/rbenv)
* [https://github.com/sstephenson/ruby-build](https://github.com/sstephenson/ruby-build)
* [https://github.com/rkh/rbenv-update](https://github.com/rkh/rbenv-update)
* [https://github.com/postmodern/chruby](https://github.com/postmodern/chruby)
