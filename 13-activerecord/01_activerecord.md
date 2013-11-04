!SLIDE center transition=uncover
# Active Record

!SLIDE smbullets small transition=uncover
# Introducción

* Representa la M de MVC (el modelo)
* Conecta clases a tablas de una base de datos estableciendo una capa de
  persistencia
* La librería provee una clase base que al subclasearse, mapea la nueva clase
  con una tabla existente de una base de datos
* En el contexto de una aplicación a estas clases suelen llamarselas **modelos**
* Los modelos pueden conectarse con otros modelos usando **asociaciones**
* Active Record se basa muchísimo en convenciones de nombres de forma tal que
  utiliza el nombre de una clase o asociación para establecer mapeos con tablas
  de la base de datos y claves foráneas.
  * A pesar de poder definir estos mapeos en forma explícita, es muy
    recomendable seguir las convenciones de nombres, especialmente durante el
    aprendizaje de la librería

!SLIDE bullets transition=uncover
# ORM

* Object Relational Mapping (ORM) es una técnica que conecta objetos de una
  aplicación a tablas de un RDBMS. 
* Utilizando ORM, las propiedades y relaciones de los objetos en una aplicación
  pueden ser fácilmente almacenados y recuperados de una base de datos **sin**
  escribir SQL directamente, minimizando el código de base de datos

!SLIDE bullets transition=uncover
# Active Record como Framework de ORM

* Representa modelos y sus datos
* Representa asociaciones entre los modelos
* Representa herencia entre modelos
* Validaciones de modelos antes de ser persistidos
* Operaciones de bases de datos de forma orientada a objetos

!SLIDE smbullets transition=uncover
# Convention over configuration para Active Record 
* En la mayoría de los frameworks ORM es necesario configurar varios archivos
  para comenzar a operar
* En Active Record, si se siguen las convenciones adoptadas por Rails, será
  necesario escribir muy pocas configuraciones (en algunos casos ninguna
  configuración) para crear modelos
* La configuración explícita será necesaria sólo cuando no pueda seguirse la
  convención estandar


!SLIDE smbullets small transition=uncover
# El primer ejemplo

* Active Record mapea automáticamente entre tablas y clases, atributos y
  columnas

## Ejemplo

	@@@ruby
	class Product < ActiveRecord::Base
	end

La clase `Product` **se mapea automáticamente a la tabla llamada `products`**, que
podría ser algo como:

	@@@sql
	CREATE TABLE products (
		id int(11) NOT NULL auto_increment,
		name varchar(255),
		PRIMARY KEY  (id)
	);

Además se definen los siguientes accessors: `Product#name` y
`Product#name=(new_name)`

*Ver ejemplo `13/00-intro-ar` y notar que no funcionará si no existe la tabla
creada*

!SLIDE bullets transition=uncover
# Convenciones de nombres
* Los nombres de las clases se pluralizan para encontrar las tablas
	* Por ejemplo `Book` se mapea a `books` 
	* El mecanismo de pluralización (definido por Rails) es muy potente y puede
	  pluralizar (y singularizar) palabras regulares como irregulares. 
	* Cuando las clases se componen de más de una palabra, se utiliza **CamelCase** 
	  y el nombre de la tabla se compone de las palabras separadas por
	  underscores. Por ejemplo: la clase `BookClub` se mapeará a la tabla
	  `book_clubs`

!SLIDE bullets transition=uncover
# Ejemplo de mapeos
	@@@
	
		+---------------+---------------+
		| Model / Class | Table / Schema|
		+---------------+---------------+
		| Post          | posts         |
		| LineItem      | line_items    |
		| Deer          | deers         |
		| Mouse         | mice          |
		| Person        | people        |
		+---------------+---------------+
	
!SLIDE bullets transition=uncover
# Convenciones sobre los esquemas
* Active Record utiliza convenciones para las columnas de las tablas,
  dependiendo del propósito de estas columnas
	* **Claves foráneas:** deben llamarse de la siguiente forma:
	  `nombre_en_singular_id` (por ejemplo: `item_id`, `order_id`). Estos serán
	  los campos por los que Active Record buscará cuando se creen asociaciones entre
	  modelos
	* **Claves primarias:** por defecto, Active Record utilizará una columna de
	  tipo entero llamada `id` como clave primaria. Cuando se usan *Migraciones de
    active Record* para crear las tablas, esta columna se creará automáticamente

!SLIDE smbullets small transition=uncover
# Más convenciones sobre los esquemas
* `created_at`: esta columna automáticamente setea la fecha y hora cuando el
  registro es creado
* `updated_at`: esta columna automáticamente setea la fecha y hora cuando el
  registro es actualizado
* `lock_version`: agrega [optimistic
  locking](http://api.rubyonrails.org/classes/ActiveRecord/Locking/Optimistic.html) al modelo
* `type`: especifica que el modelo utiliza [Single Table
  Inheritance](http://api.rubyonrails.org/classes/ActiveRecord/Base.html#label-Single+table+inheritance)
* `(association_name)_type`: especifica el tipo de [asociaciones
  polimórifcas](http://edgeguides.rubyonrails.org/association_basics.html#polymorphic-associations)
* `(table_name)_count`: usado para cachear el número de registros que perteneces
  a una asociación. Por ejemplo, una columna `comments_count` en la clase `Post` que tiene muchas instancias de `Comment`, cacheará el número de comentarios existentes para cada post.

!SLIDE smbullets small transition=uncover
# Creando modelos en Active Record
* Es muy simple crear modelos con Active Record
	* Simplemente se subclasea `ActiveRecord::Base` y listo

## Por ejemplo
	@@@ruby
	class Product < ActiveRecord::Base
	end
	p = Product.new
	p.name = "Some Book"
	puts p.name # "Some Book"

* Esto creará el mapeo entre `Prodyuct` y la tabla `products`. 
* Además exisitrá el mapeo de cada campo en la tabla a accessors del objeto.

!SLIDE bullets transition=uncover
# CRUD: Leyendo y escribiendo datos 
* CRUD significa **C**reate, **R**ead, **U**pdate, **D**elete
* Active Record provee métodos que permiten a la aplicación leer y escribir
  datos en las tablas

!SLIDE bullets transition=uncover
# Creación
* Los objetos Active Record 

!SLIDE bullets transition=uncover
# Referencias

* http://edgeguides.rubyonrails.org/active_record_basics.html
