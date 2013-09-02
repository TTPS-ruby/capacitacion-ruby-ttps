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

!SLIDE bullets transition=uncover
# Interacción con GIT

* Objetivo
  * Instalar `git`
  * Aprender el workflow simple de trabajo con git

* Actividad
  * Acceder a https://github.com/TTPS-ruby/sandbox
  * Leer la actividad para el directorio `alumnos/` en el **README** del
    proyecto **sandbox**

!SLIDE smbullets transition=uncover
# ¿Qué es un branch?

* Es un puntero a un commit

![what-a-branch-is](18333fig0304-tn.png)

!SLIDE smbullets transition=uncover
# ¿Y cómo sabe git en que branch estamos actualmente?

* Otro puntero: HEAD

![head](18333fig0305-tn.png)

!SLIDE smbullets transition=uncover
# Cambiando de branch

```
$ git checkout testing
```

![checkout](18333fig0306-tn.png)

* Lo único que hace es cambiar HEAD!

!SLIDE smbullets transition=uncover
# Haciendo cambios en un branch

```
$ vi test.rb
```

```
$ git commit -am 'made a change'
```

![changing-branches](18333fig0307-tn.png)

!SLIDE smbullets transition=uncover
# Volviendo a master

```
$ git checkout master
```

![master](18333fig0308-tn.png)

!SLIDE smbullets transition=uncover
# Haciendo cambios en master

```
$ vi test.rb
```

```
$ git commit -am 'made other changes'
```

![more-changes](18333fig0309-tn.png)

!SLIDE smbullets transition=uncover
# Branching y merging

![first](18333fig0310-tn.png)

!SLIDE smbullets transition=uncover
# Branching y merging

![second](18333fig0311-tn.png)

!SLIDE smbullets transition=uncover
# Branching y merging

![third](18333fig0312-tn.png)

!SLIDE smbullets transition=uncover
# Branching y merging

![fourth](18333fig0313-tn.png)

!SLIDE smbullets transition=uncover
# Branching y merging: fast-forward

```
$ git checkout master
```

```
$ git merge hotfix
```

![fifth](18333fig0314-tn.png)

!SLIDE smbullets transition=uncover
# Branching y merging

![sixth](18333fig0315-tn.png)

!SLIDE smbullets transition=uncover
# Branching y merging: merge made by recursive

```
$ git checkout master
```

```
$ git merge iss53
```

![seventh](18333fig0316-tn.png)

!SLIDE smbullets transition=uncover
# Branching y merging

![eighth](18333fig0317-tn.png)

!SLIDE smbullets transition=uncover
# Merge: Conflictos

* Remotos

![remote](18333fig0322-tn.png)

!SLIDE smbullets transition=uncover
# Merge: Conflictos

![remote-2](18333fig0323-tn.png)

!SLIDE smbullets transition=uncover
# Merge: Conflictos

![remote-3](18333fig0324-tn.png)

!SLIDE smbullets transition=uncover
# Merge: rebasing

* Tomar un patch del cambio y re-aplicarlo en otro branch

![rebasing](18333fig0327-tn.png)

!SLIDE smbullets transition=uncover
# Merge: rebasing

```
$ git checkout experiment
```

```
$ git rebase master
```

![rebasing-2](18333fig0329-tn.png)

!SLIDE smbullets transition=uncover
# Merge: rebasing

![rebasing-2](18333fig0330-tn.png)

!SLIDE smbullets transition=uncover
# Merge: rebasing

* La historia es más limpia
* Simula una historia lineal

!SLIDE smbullets transition=uncover
# Juegos!

* [GitHug](https://github.com/Gazler/githug)
* [Learn git branching](http://pcottle.github.io/learnGitBranching)
