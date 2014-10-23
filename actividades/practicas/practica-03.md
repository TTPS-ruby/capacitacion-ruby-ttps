TTPS Opción Ruby

Práctica 3: Excepciones, Bundler/Gemas y Tests
==============================================

- Antes de comenzar recordá:
    - Todos los ejercicios deben tener tests (excepto los de Bundler)

Excepciones
-----------

1. Pruebe divisiones por cero con Fixnums y con Floats.

1. ¿Qué sucede si intenta abrir con File.open un archivo que no existe?

1. Se debe implementar un método `leer`, que dado un nombre de archivo lo
    lea y retorne un string con su contenido. En caso que el archivo no exista
    debe crearlo y retornar un string vacío.

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

1. Pruebe las diferencias entre ```Hash#[]``` y ```Hash#fetch``` con uno y
    con dos argumentos.

1. Cree la clase Robot y la clase Humano, implemente:
    - Robot#atacar que recibe una instancia de que matar.
    - Robot#tirar_pilas que recibe un símbolo que indica en que lugar se
      descartarán las pilas.
    - Humano#recibir_ataque que recibe la instancia del atacante.

    El método ```Robot#atacar``` deben seguir las
    [3 leyes de la robótica](http://es.wikipedia.org/wiki/Tres_leyes_de_la_rob%C3%B3tica)
    y además la ley 0.

    Cuando un robot reciba una orden que vaya contra las leyes debe lanzar una
    exepción con una descripción acorde.

    Por ejemplo:
    ```
    luke = Humano.new
    c3po = Robot.new
    r2d2 = Robot.new
    c3po.atacar luke # Debe lanzar una exepción porque viola la ley 2.
    c3po.atacar r2d2 # No viola ninguna ley
    c3po.atacar c3po # Viola la 3° ley
    c3po.tirar_pilas :cesto_reciclables # No viola ninguna ley
    c3po.tirar_pilas :mar # Viola la ley 0
    c3po.tirar_pilas :sdadwe # Lanza una excepción porque el lugar no es válido
    ```
1. Implemente un programa de consola interactivo que permita enviar las
    instrucciones disponibles a c3po y a r2d2 eligiendo desde un menú
    quién será el destinatario de la acción.

    Ante una excepción el programa debe capturarla y mostrar un mensaje
    para el usuario indicando el error. Luego el programa debe
    seguir funcionando.

Gemas y Bundler
---------------

1. Creá un directorio e inicializalo con *Bundler*. Analizá si
bundler provee un mecanismo de inicialización que no sea creando un
archivo Gemfile manualmente.

1. En un proyecto que utilice bundler, instalá la gema `rubywarrior`.
    Luego corré el comando rubywarrior y seguí las instrucciones en la
    pantalla (En caso de tener problemas con el comando anterior, utilizá
    `bundle exec rubywarrior`).

    Para  más  información  ver
    [rubywarrior](https://github.com/ryanb/ruby-warrior).

1. Escribí un programa llamado  gh  -  contributors , que utilice
    la gema  Octokit   y permita imprimir en pantalla las contribuciones
    a un proyecto determinado en Github. Por ejemplo:

    ```
    car@latitud:\~ttps\$ bundle exec ruby gh-contributions.rb https-ruby/capacitacion-ruby-ttps

    Contributions
      chrodriguez (28)
      patriciomacadden (14)
      juanangelsilva (2)
      F-3-r (1)
      ggoral (1)
      rapofran (1)
    ```

    Considerá  las  siguientes  operaciones :
    - ```Octokit.repo 'user/project'``` devuelve un objeto con los datos de un
     repositorio

    - Asumiendo el objeto anterior se asigna a la variable repo, entonces
    ```repo.rels[:contributors].get.data``` devuelve un arreglo con cada
     usuario que contribuyó.

    Referencias en [rb](https://github.com/octokit/octokit.rb)

1. Analizando el proyecto creado para el ejercicio anterior, analizá:

    a - ¿En qué archivo se guardan las versiones de las gemas instaladas por
    bundler?

    b - ¿Qué versión de octokit se utiliza al ejecutar con ```bundle exec```?

    c - Modificá el Gemfile de tu proyecto para que dependa de octokit 2.4.0
    y ejecutá ```bundle install```. ¿En qué archivo se refleja el cambio de
    versión luego de instalar (además del Gemfile)?

    d - Ejecutá ```gem search -l octokit``` para ver las versiones de octokit
    instaladas.

    e - Ejecutá ```bundle install --deployment```, investiguá los contenidos
    del directorio ```vendor``` y el directorio ```.bundler``` creados por
    este comando.
    ¿Para qué puede servir ese comando?

    f - Leé las recomendaciones de la página de bundler en la sección
    ```Deploying``` sobre qué archivos es recomendable versionar y cuales no.

Testing
--------

Todos los ejercicios de esta sección deben contar con tests ya sea con
MiniTest::Unit o con MiniTest::Spec. Intente cubrir todos los casos que
tenga sentido probar y hacer que cada test sea simple y pruebe una sola cosa.

1. Implemente tests para los siguientes ejercicios de la práctica 2:
    - Ejercicio 1 de módulos y mixings.
    - Ejercicios 1, 2, 3, 4 y 9 de la parte de clases y objetos.

1. Implemente tests para los ejercicios de la primer parte de esta práctica
    (vea #assert_raises o #must_raise dependiendo de si usa Unit o Spec).
    En los ejercicios 2 y 3 tome las acciones necesarias para poder testear el
    código sin crear archivos y sin conectarse a la red, el ejercicio 3 tiene
    esa parte parcialmente resuelta.

    Vea:
    - http://es.wikipedia.org/wiki/Inyecci%C3%B3n_de_dependencias
    - http://www.martinfowler.com/articles/injection.html

1. Si aún no lo hizo descubra las características de Ruby a través de tests
    de casos extremos con [Ruby Koans](http://koans.herokuapp.com/en).

1. Warlock Party

Implementar el juego Warlock Party usando *test-driven development*.

El objetivo del mismo consiste que tu personaje (un brujo/a) logre alzcanzar
 su cerveza en un festín post-batalla altamente concurrido. El brujo puede
 realizar las siguientes acciones:

    * `warlock.move!`
      mueve al brujo en la dirección en la que está mirando. Si hay algo delante, el brujo no puede moverse.

    * `warlock.cast!`
          Lanza un hechizo en la dirección actual. Actualmente el brujo sólo conoce 2 hechizos:
            - :fireball => lanza una bola de fuego en la dirección en la que está mirando. Sirve para explotar otros brujos que intentan robarse TU cerveza. La bola de fuego avanza 3 casilleros hasta chocar con el primer obstáculo.
            - :dematerialize => hace que el brujo tome su forma inmaterial. Esto le permite atravesar obstáculos (por ejemplo otros brujos con los cuales el alcohol a dado por tierra) y paredes.
          
    * `warlock.turn(direction)`
      Gira al brujo 90° en la dirección indicada. Los posibles valores para el parámetro son :right o :left

    * `warlock.look`
         El brujo mira qué hay en la dirección actual y nos cuenta qué hay. Este método retorna: 
          - :nothing => si en el siguiente espacio no hay nada,
          - :drunk   => si en el siguiente espacio hay alguna criatura bajo los efectos del alcohol
          - :beer    => si en el siguiente espacio esta la cerveza buscada
          - :wall    => si en el siguiente espacio hay una pared

    * `warlock.drink!`
        Hace que el brujo beba lo que tenga adelante. Es sabido que los brujos mueren si beben aire, paredes o alguna otra criatura alcoholizada.


La clase `WarlockParty` es la encargada de mantener el estado del juego. El juego procede por rondas, en cada ronda se debe invocar el bloque del warlock, actualizar la posición del mismo en el festín y verificar las siguientes condiciones:

 - El brujo sólo puede realizar una acción ! por turno (es decir, :move!, :cast! o :drink!). En caso de que haya más de una acción ! en el misma vuelta, el juego debe abortar informando del error.
 - el brujo sólo púede utilizar un hechizo de cada tipo por partida.
 - En cada vuelta el brujo pierde un punto de hidratación. En caso de no conseguir una cerveza antes de los 20 turnos, el brujo muere de sed.
 - El bloque del warlock se ejecuta repetidamente en tanto el warlock siga vivo.


Implementar las clases Warlock y WarlockParty de manera que las siguientes jugadas terminen como se indica:

```ruby
party = <<-PARTY
......
. ^b .  
......
PARTY

WarlockParty.new(party) do |warlock|
  warlock.turn(:right)
  warlock.drink!
end

#=> Win! el brujo consiguió sano y salvo su cerveza
```

```ruby
party = <<-PARTY
......
. ^b .  
......
PARTY

WarlockParty.new(party) do |warlock|
  warlock.drink!
end

#=> el brujo muere atorado por beberse una pared
```

```ruby
party = <<-PARTY
............
. >     db .  
............
PARTY

WarlockParty.new(party) do |warlock|
  if warlock.look == :nothing
    warlock.move!
  else
    warlock.cast! :fireball
    warlock.move!
    warlock.drink!  
  end
end

#=> Jugada invalida ejecuta mas de una acción ! en un turno.
```

```ruby
party = <<-PARTY
...............
. >    * *.  b.  
...............
PARTY

WarlockParty.new(party) do |warlock|
  ahead = warlock.look
  case ahead
    when :nothing
      warlock.move! 
    when :drunk
      warlock.cast! :fireball
    when :wall
      warlock.cast! :dematerialize
    when :beer
      warlock.drink!
  end
end

#=> jugada inválida, invoca dos bolas de fuego en la misma jugada.
```


```ruby
party = <<-PARTY
..............
. >    * .  b.  
..............
PARTY

WarlockParty.new(party) do |warlock|
  ahead = warlock.look
  case ahead
    when :nothing
      warlock.move! 
    when :drunk
      warlock.cast! :fireball
    when :wall
      warlock.cast! :dematerialize
    when :beer
      warlock.drink!
  end
end

#=> Win!
```

Los niveles se representan con la siguiente notación:

* * (asterisco) => obstáculo
* <, >, v, ^  (menor, mayor, v corta, acento circumflejo) => brujo mirando hacia la dirección indicada
* . (punto) => paredes


