!SLIDE center transition=uncover
# GIT

!SLIDE smbullets transition=uncover
# Características

* Snapshots, no diferencias
* Casi todas las operaciones son locales
* Tiene integridad

!SLIDE smbullets transition=uncover
# Los 3 estados

* Working directory
* Staging area
* Git directory (Repositorio)

!SLIDE transition=uncover
# Operaciones locales

![local-operations](18333fig0106-tn.png)

!SLIDE smbullets transition=uncover
# Obteniendo un repositorio git

* Inicializar un repositorio en un directorio existente

```
$ git init
```

* Clonando un repositorio existente

```
$ git clone https://github.com/rails/rails.git
```

!SLIDE transition=uncover
# Ciclo de vida de un archivo

![file-status-lifecycle](18333fig0201-tn.png)

!SLIDE smbullets transition=uncover
# Remotos

* Son repositorios externos (ejemplo: de coworkers).
* Puede haber n remotos

!SLIDE center transition=uncover
# El workflow completo
![workflow completo git](git-workflow.png)

!SLIDE center transition=uncover
# Actividad con GIT

!SLIDE bullets small transition=uncover
# Interacción con GIT

* Objetivo
  * Instalar `git`
  * Aprender el workflow simple de trabajo con git

* Actividad
  * Acceder a [https://github.com/TTPS-ruby/sandbox](https://github.com/TTPS-ruby/sandbox)
  * Leer la actividad para el directorio `alumnos/`
