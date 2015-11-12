!SLIDE center transition=uncover
# Active Record: validaciones

!SLIDE bullets small transition=uncover
# Introducción

* Garantizan que se guarden datos válidos en la base de datos
* Hay alternativas:
  * Con validaciones en la DB como restricciones o store procedures, dificultan
    la portabilidad de la aplicación a otros motores. Además no es simple
    realizar los tests de la aplicación. Sin embargo, no es unamala práctica
    aplicar restricciones en la base de datos
  * Del lado del cliente usando por ejemplo JS. Pero esta funcionalidad no
    aplica a todos los usuarios, dado que un navegador puede no diponer de JS o
    un usuario mal intencionado podría enviar datos no validados de forma
    intencional
  * Validaciones en el controlador podría ser una alternativa. Sucede que el
    testeo de los controladores se complejizaría. Por otra parte es una buena
    idea mantener los controladores bien delgados

!SLIDE smbullets small transition=uncover
# ¿Cuándo ocurren las validaciones?

* Hay dos tipos de objetos en AR: 
  * Los que corresponden a una fila de la base de datos
  * Los que aún no están en la DB. Por ejemplo los objetos creados con `.new`
    hasta que no se les diga `save`
* Exite el método `.new_record?` que indica la situación de un objeto

## Ejemplo

	@@@ruby
	Person = Class.new(ActiveRecord::Base)
	p = Person.new(name: "John Doe")
	p.new_record?
	p.save
	p.new_record?

!SLIDE bullets small transition=uncover
# ¿Cuándo ocurren las validaciones?

* Crear y guardar un objeto emite un `INSERT` a la DB
* Actualizar un objeto emite un `UPDATE` a la DB
	* Antes de estas acciones, se realizan las validaciones. Si alguna de las validaciones **falla** 
entonces el objeto será marcado como **inválido** y ActiveRecord no realizará el
`INSERT` o `UPDATE`
* Hay muchas formas de cambiar el estado de un objeto en la DB. Algunos métodos
  realizarán validaciones, pero otros no, significando que podrían guardarse
datos **inválidos** en la DB

!SLIDE bullets small transition=uncover
# ¿Cuándo ocurren las validaciones?

## Métodos que realizan validaciones

	@@@ruby
	create
	create!
	save # Puede recibir validate: false
	save!
	update
	update!

## Métodos que NO realizan validaciones
 
	@@@ruby
	decrement!
	decrement_counter
	increment!
	increment_counter
	toggle!
	touch
	update_all
	update_attribute
	update_column
	update_columns
	update_counters

!SLIDE bullets small transition=uncover
# `#valid?` e `#invalid?`

* Independientemente de los métodos antes mencionados que lanzan las
  validaciones, puede utilizarse `valid?` e `invalid?` para lanzar las
validaciones

## Ejemplo

	@@@ruby
	class Person < ActiveRecord::Base
		validates :name, presence: true
	end
	 
	Person.create(name: "John Doe").valid? # => true
	Person.create(name: nil).valid? # => false

!SLIDE bullets small transition=uncover
# Los errores

* Una vez que se realizaron las validaciones, AR almacenará los errores en
  `errors.messages`, una colección de errores indexada por el campo con errores
* Por definición un objeto será valido si la colección de errores es vacía luego
  de correr las validaciones
* Notar que un objeto creado con `new` que técnicamente es erróneo, no muestra
errores porque aún no se han corrido las validaciones

!SLIDE bullets small transition=uncover
# Helper: acceptance 

* Se utiliza específicamente en aplicaciones WEB donde se espera que un checkbox
  sea tildado por el usuario
* No es necesario que la base de datos tenga un atributo, sino que el helper
  creará un campo virtual para este propósito

##Ejemplo

	@@@ruby
	class Person < ActiveRecord::Base
	  validates :terms_of_service, acceptance: true
	end

!SLIDE bullets small transition=uncover
# Helper: validates_associated

* Valida las asociaciones relacionadas al objeto
* No debe utilizarse en ambas partes de una asociación porque puede terminar en
  **loop infinito**

##Ejemplo

	@@@ruby
	class Library < ActiveRecord::Base
		has_many :books
		validates_associated :books
	end

!SLIDE bullets small transition=uncover
# Helper: confirmation

* Se utiliza cuando dos campos de texto deben contener el mismo dato: por
  ejemplo que las direcciones de mail y su confirmación sean similares
* El campo de confirmación no debe existir, sino que crea un campo virtual
  llamado `_confirmation`
* El chequeo es realizado sólo si el campo `_confirmation` no es nil, por lo que
  debe asegurarse su exsistencia

##Ejemplo

	@@@ruby
	class Library < ActiveRecord::Base
		validates :email, confirmation: true
		validates :email_confirmation, presence: true
	end

!SLIDE bullets small transition=uncover
# Helper: exclusion/inclusion

* Se utilizan para validar la (ex/in)clusión de valores admisibles 

##Ejemplo

	@@@ruby
	class Library < ActiveRecord::Base
		validates :subdomain, 
			exclusion: { in: %w(www us ca jp)
	end
	
	class Coffee < ActiveRecord::Base
		validates :size, 
			inclusion: { in: %w(small medium large),
			message: "%{value} is not a valid size" }
	end

!SLIDE bullets small transition=uncover
# Helper: format

* Validan el formato con una expresión regular que se especifica usando la
  opción `with:`

##Ejemplo

	@@@ruby
	class Product < ActiveRecord::Base
		validates :legacy_code, format: { 
			with: /\A[a-zA-Z]+\z/,
			message: "only allows letters" }
	end

!SLIDE bullets small transition=uncover
# Helper: length

* Valida la longitud de un campo de diversas formas

##Ejemplo

	@@@ruby
	class Person < ActiveRecord::Base
		validates :name, length: { minimum: 2 }
		validates :bio, length: { maximum: 500 }
		validates :password, length: { in: 6..20 }
		validates :registration_number, length: { is: 6 }
	end

!SLIDE bullets smaller transition=uncover
# Helper: numericality

* Valida que el campo contenga sólo valores numéricos
* Por defecto aceptará un signo opcional seguido de un entero o punto flotante
* Para validar sólo enteros, puede usarse la opción `only_integer`
	* Además se admiten muchas otras opciones: `:greater_than`, `:greater_than_or_equal_to`, `:equal_to`, `:less_than`, `:less_than_or_equal_to`, `:odd`, `:even`

##Ejemplo

	@@@ruby
	class Player < ActiveRecord::Base
		validates :points, numericality: true
		validates :games_played, 
			numericality: { only_integer: true }
	end

!SLIDE bullets smaller transition=uncover
# Helper: presence/absence

* Valida que el atributo esté o no presente (esté vacío) usando `blank?` para
  verificar si un valor es `nil` o un string blanco (esto es vacío o consiste de
	espacios)
	* Incluso prmite validar que una asociación esté presente

##Ejemplo

	@@@ruby
	class Person < ActiveRecord::Base
		validates :name, :login, :email, presence: true
	end

	# Es importante para usar el siguiente ejemplo que la 
	# asociación use inverse_of
	class LineItem < ActiveRecord::Base
		belongs_to :order
		validates :order, presence: true
	end

	class Order < ActiveRecord::Base
		has_many :line_items, inverse_of: :order
	end

!SLIDE bullets smaller transition=uncover
# Helper: presence/absence

* Dado que `false.blank?` es `true`, hay que tener especial cuidado con campos
  booleanos
* En el siguiente ejemplo se muestra de qué forma es posible eliminar la
  posibilidad que el campo sea `nil`
	* Para el caso de `absence` es necesario algo como: `validates :field_name,
	  exclusion: { in: [true, false]` considerando que `false.present?` devuelve
	  `false`

## Ejemplo

	@@@ruby
	validates :boolean_field_name, inclusion: { in: [true, false] }
	validates :boolean_field_name, exclusion: { in: [nil] }

!SLIDE bullets smaller transition=uncover
# Helper: uniqueness

* Valida la unicidad de un campo antes que sea guardado
* No considera unicidad en la base de datos
	* Por lo que dos conexiones diferentes podrían crear el mismo dato que
	  esperamos sea único
	* Para evitar esto, es aconsejable agregar una restricción a nivel motor de la
	  DB
* Exite la posibilidad de explicitar un alcance de la unicidad de forma de
  combinar con otros campos
* Es posible especificar otra opción `case_sesitive` para verificar la unicidad
  considerando este factor o no

## Ejemplo

	@@@ruby
	class Account < ActiveRecord::Base
		validates :email, uniqueness: true
	end

!SLIDE bullets small transition=uncover
# Helper: uniqueness

## Más ejemplos

	@@@ruby
	class Holiday < ActiveRecord::Base
		validates :name, uniqueness: {
			scope: :year,
			message: "should happen once per year" }
	end

	class Person < ActiveRecord::Base
		validates :name, 
			uniqueness: { case_sensitive: false }
	end

!SLIDE bullets small transition=uncover
# Validaciones condicionales

* Algunas situaciones ameritan validar si un predicado es verdadero
* Esto es posible con las opciones `:if` y `:unless` que reciben:
  `Proc`, un string o arreglo
	* **Un símbolo:** invocará un método del modelo
	* **Un string:** se interpreta como código rubu como por ejemplo `validates
	  :surname, presence: true, if: "name.nil?"`
	* **Un Proc:** permite escribir código inline en vez de delegarlo a un método
	* **Un arreglo**: combina multiples condiciones. Por ejemplo: `if:
	  ["market.retail?", :desktop?]`



