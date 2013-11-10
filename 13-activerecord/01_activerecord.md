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
	  pluralizar (y singularizar) tanto palabras regulares como irregulares. 
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
* `(table_name)_count`: usado para cachear el número de registros que pertenecen
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

* Esto creará el mapeo entre `Product` y la tabla `products`. 
* Además exisitrá el mapeo de cada campo en la tabla a accessors del objeto.

!SLIDE bullets transition=uncover
# CRUD: Leyendo y escribiendo datos 
* CRUD significa **C**reate, **R**ead, **U**pdate, **D**elete
* Active Record provee métodos que permiten a la aplicación leer y escribir
  datos en las tablas

!SLIDE smbullets small transition=uncover
# Creación
* Los objetos Active Record pueden crearse desde:
  * Un Hash
  * Un bloque
  * Setear manualmente los atributos luego de la creación
* El método `new` retornará un objeto **nuevo** mientras que `create` retornará
  un objeto y lo **guardará** en la base de datos

## Ejemplo

	@@@ruby
	user = User.create(name: "David",
	                   occupation: "Code Artist")
	# es lo mismo que:
	user = User.new
	user.name = "David"
	user.occupation = "Code Artist"
	user.save

!SLIDE smbullets transition=uncover
# Creación con bloques

	@@@ruby
	user = User.new do |u|
		u.name = "David"
		u.occupation = "Code Artist"
	end

*funciona tanto con `new` como `create`*

!SLIDE bullets small transition=uncover
# Lectura

* Active Record provee una completa API para acceder a los datos de una base de
  datos

## Ejemplos

	@@@ruby
	# return a collection with all users
	users = User.all
	
	# return the first user
	user = User.first
	
	# find all users named David who are Code Artists and 
	# sort by created_at inreverse chronological order
	users = User.where(name: 'David', 
	                   occupation: 'Code Artist').
	                   order('created_at DESC')

!SLIDE bullets smaller transition=uncover
# Actualización

* Una vez que un dato es recuperado, sus atributos pueden modificarse y luego
  almacenarse en la base de datos nuevamente

## Ejemplo

	@@@ruby
	user = User.find_by(name: 'David')
	user.name = 'Dave'
	user.save
	
	# Lo mismo pero más corto
	user = User.find_by(name: 'David')
	user.update(name: 'Dave')
	
	# Para cambios masivos
	User.update_all "max_attempts = 3, must_change_pwd = 'true'"

!SLIDE bullets transition=uncover
# Eliminación

* De igual forma, una vez recuperado un objeto Active Record, podrá destruirse 
  y a su vez eliminarse de la base de datos

## Ejemplo

	@@@ruby
	user = User.find_by(name: 'David')
	user.destroy

!SLIDE bullets small transition=uncover
# Validaciones

* Active Record permite validar el estado de un modelo antes de que sea escrito
  a la base de datos
* Existen varios mecanismos para validar y chequear que ciertos atributos no
  sean blanco, no vacío, únicos, tener un formato específico, etc. 
* Las validaciones deben ser consideradas a la hora de persistir datos en la
  base de datos
	* Por ello, los métodos como `create`, `save` y `update` consideran las
	  validaciones. 
	* Retornan `false` cuando la validación falla y no actualizan el dato en la
	  base de datos
	* Todos estos métodos tiene sus correspondientes con bang! (`create!`,
	  `save!`y `update!`) que son estrictos en cuanto a lanzar una excepción `ActiveRecord::RecordInvalid `
	  cuando la validación falla.

!SLIDE bullets transition=uncover
# Ejemplo de Validaciones

	@@@ruby
	class User < ActiveRecord::Base
		validates :name, presence: true
	end
	 
	User.create  
	# => false
	User.create! 
	# => ActiveRecord::RecordInvalid: 
	#    Validation failed: 
	#    Name can't be blank

!SLIDE smbullets transition=uncover
# Callbacks
* Active Record callbacks permiten adjuntar código a ciertos eventos en el ciclo
  de vida de los modelos.
* Permiten agregar comportamiento a los modelos que es ejecutado de forma transparente 
  cuando estos eventos suceden.
* Pueden agregarse eventos cuando se crea un nuevo registro, al modificarse, al
  eliminarse, etc.

!SLIDE bullets transition=uncover
# Migraciones
* Las migraciones son una DSL para el manejo de esquemas de bases de datos
  llamados migraciones
* Las migraciones se almacenan en archivos que son ejecutados contra una base de
  datos soportada por Active Recors usando `rake`

!SLIDE smbullets smaller transition=uncover
# Migraciones
## Ejemplo de una migración que crea una tabla

	@@@ruby
	class CreatePublications < ActiveRecord::Migration
		def change
			create_table :publications do |t|
				t.string :title
				t.text :description
				t.references :publication_type
				t.integer :publisher_id
				t.string :publisher_type
				t.boolean :single_issue
	 
				t.timestamps
			end
			add_index :publications, :publication_type_id
		end
	end

!SLIDE smbullets transition=uncover
# Migraciones

* Las migraciones permiten tener un registro en la misma base de datos que
  indica qué cambios se han aplicado
* Los cambios entonces pueden versionarse y comitirse o deshacerse en la base de
  datos
* Para aplicar las migraciones pendientes: `rake db:migrate`
* Para deshacer un cambio hecho: `rake db:rollback`
* La DSL es agnóstico a la base de datos: funciona en Mysql, SQlite, Oracle,
  Postgres, etc

!SLIDE smbullets transition=uncover
# Referencias

* [API](http://api.rubyonrails.org/classes/ActiveRecord/Base.html)
* [Active Record base](http://edgeguides.rubyonrails.org/active_record_basics.html)
* [Active Record Associations](http://guides.rubyonrails.org/association_basics.html)
* [Active Record Querying](http://edgeguides.rubyonrails.org/active_record_querying.html)
* [Active Record Validations](http://edgeguides.rubyonrails.org/active_record_validations.html)
* [Active Record
  Callbacks](http://edgeguides.rubyonrails.org/active_record_callbacks.html)
* [Active Record Migrations](http://edgeguides.rubyonrails.org/migrations.html)

## Desde Sinatra
* [Active Record y Sinatra](https://github.com/janko-m/sinatra-activerecord)
* [Active Record micro_migrations](https://github.com/svenfuchs/micro_migrations)
