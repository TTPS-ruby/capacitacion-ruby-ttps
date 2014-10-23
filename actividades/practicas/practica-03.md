TTPS Opción Ruby

Práctica 3: Excepciones, Bundler/Gemas y Tests
==============================================

- Antes de comenzar recordá:
    - Todos los ejercicios deben tener tests (excepto los de Bundler)

Excepciones
-----------

1. ¿Qué sucede si intenta abrir con File.open un archivo que no existe?

1. Se debe implementar un método `leer`, que dado un nombre de archivo lo
lea y retorne un string con su contenido. En caso que el archivo no exista
retornar un string vacío.

Por ejemplo:
```
> leer '/etc/issue'
=> "Lihuen 5.10 5.10 GNU/Linux \\n \\l\n"
> leer 'sdcassdasd'
=> ""
```

Implemente 2 versiones del método anteriormente descripto, una usando
manejo de excepciones y otra sin usar manejo de excepciones.

1. Implemente el método Movies.search que permitirá obtener la información de
las películas buscadas en un Array de Hashes. Para obtener la información
deberá usar la API de http://www.omdbapi.com/.

Ejemplos de uso:
```
> Movies.search 'spiderman'
=> ...
> Movies.search 'spiderman', 1968
=> [{:title=>"The Origin of Spiderman", :year=>"1968", :imdbid=>"tt0826480", :type=>"episode"}, {:title=>"Spiderman Battles the Molemen", :year=>"1968", :imdbid=>"tt0826474", :type=>"episode"}]
```

El método search debe recibir 3 argumentos:
- title: el título de la película.
- year: el año de la película (keyword argument, por defecto debe buscar
  todos los años).
- http: el objeto que se usará para obtener la información, este objeto debe
aceptar el método #get (keyword argument, por defecto Net::HTTP).


Movies.search debe lanzar una excepción si el año no se puede convertir
a entero:
```
# Los siguentes ejemplos deben funcionar
Movies.search 'spiderman', 1968
Movies.search 'spiderman', '1968'
# El siguiente ejemplo deben lanzar la excepción:
Movies.search 'spiderman', '1968ssss'
```

Movies.search debe lanzar una excepción si el parámetro http no soporta
el método #get:
```
> Movies.search 'spiderman', http: nil
=> ...
```


Gemas y Bundler
---------------

1 - Creá un directorio e inicializalo con *Bundler*. Analizá si
bundler provee un mecanismo de inicialización que no sea creando un
archivo Gemfile manualmente.

2 - En un proyecto que utilice bundler, instalá la gema `rubywarrior`.
Luego corré el comando rubywarrior y seguí las instrucciones en la
pantalla (En caso de tener problemas con el comando anterior, utilizá
`bundle exec rubywarrior`).

Para  más  información  ver
[rubywarrior](https://github.com/ryanb/ruby-warrior).

3 - Escribí un programa llamado  gh  -  contributors , que utilice
la gema  Octokit   y permita imprimir en pantalla las contribuciones
a un proyecto determinado en Github. Por ejemplo:

\

 car  @  latitud  :\~  ttps  \$  bundle    exec    ruby    gh  -  contributions  .  rb    ttps  -  ruby  /  capacitacion  -  ruby  -  ttps 

\

 Contributions    for    ttps  -  ruby  /  capacitacion  -  ruby  -  ttps  \
\   chrodriguez  (28)\
\   patriciomacadden  (14)\
\   juanangelsilva  (2)\
\   F  -3  r  (1)\
\   ggoral  (1)\
\   rapofran  (1) \
\

Considerá  las  siguientes  operaciones :

-   Octokit . repo ‘ user / project ’ devuelve  un  objeto  con  los  datos  de  un  repositorio

    -   Asumiendo  el  objeto  anterior  se  asigna  a  la  variable  repo , entonces  repo . rels [: contributors ]. get . data  devuelve  un  arreglo  con  cada  usuario  que  contribuyó

\

Referencias  en 
[rb](https://github.com/octokit/octokit.rb)

\

4 - Analizando el proyecto creado para el ejercicio anterior, analizá:

a - ¿En qué archivo se guardan las versiones de las gemas instaladas por
bundler?

b - ¿Qué versión de octokit se utiliza al ejecutar con “bundle exec”?

c - Modificá el Gemfile de tu proyecto para que dependa de octokit 2.4.0
y ejecutá “bundle install”. ¿En qué archivo se refleja el cambio de
versión luego de instalar (además del Gemfile)?

d - Ejecutá “gem search -l octokit” para ver las versiones de octokit
instaladas.

e - Ejecutá “bundle install --deployment”, investiguá los contenidos del
directorio “vendor” y el directorio “.bundler” creados por este comando.
¿Para qué puede servir ese comando?

f - Leé las recomendaciones de la página de bundler en la sección
“Deploying” sobre qué archivos es recomendable versionar y cuales no.

