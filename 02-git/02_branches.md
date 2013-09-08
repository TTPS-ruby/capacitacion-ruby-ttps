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

