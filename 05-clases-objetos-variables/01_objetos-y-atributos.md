!SLIDE center transition=uncover
# Clases, objetos y variables

!SLIDE center transition=uncover
# Empezamos por los objetos y sus atributos

!SLIDE bullets transition=uncover
# Introducción

* Luego de haber recibido una *dosis de Ruby* ya conocemos un poco sobre la
sintáxis de este lenguaje

* Para entender mejor los objetos, vamos a hacerlo mediante un ejemplo
  *-tomado del libro Programming Ruby (Pick Axe)*:

!SLIDE transition=uncover
# El problema...

## Librería de reventa de libros

Reventa de libros usuados que realiza control de stock semanalmente

Mediante lectores de códigos de barra se registra cada libro en las 
bibliotecas. Cada lector, genera un archivo separado por comas (CSV) que contiene 
una fila para cada libro registrado.

Cada fila contiene entre otros datos: ISBN del libro y precio. Un extracto del
archivo sería:

	@@@ 
	"Date","ISBN","Amount"
	"2008-04-12","978-1-9343561-0-4",39.45
	"2008-04-13","978-1-9343561-6-6",45.67
	"2008-04-14","978-1-9343560-7-4",36.95

!SLIDE smbullets transition=uncover
# ¿Qué tenemos que hacer?
* Tomar todos los CSV de cada lectora y determinar cuántos ejemplares de cada
  título disponemos
* Determinar además el monto total en libros que tenemos

!SLIDE transition=uncover
# Creamos la clase `BookInStock`

*Recordamos que los nombres de las clases deben comenzar con mayúsculas, los
métodos con minúscula*

	@@@ ruby
	class BookInStock
	end

Lo probamos:

	@@@ ruby
	a_book = BookInStock.new
	another_book = BookInStock.new

!SLIDE smbullets transition=uncover
# Pero...

* En el ejemplo anterior: 
  * Se crean dos objetos  diferentes de la clase `BookInStock`. 
  * Podríamos decir en esta primer instancia que son el mimo libro, o iguales porque nada los
  distingue...

* Lo solucionamos obligando que la inicialización indique aquellos datos que distinga al
  libro

!SLIDE smbullets small transition=uncover
# La nueva implementación
	
	@@@ ruby
	class BookInStock
		def initialize(isbn, price)
			@isbn = isbn
			@price = Float(price)
		end
	end

* El método `initialize` es especiale en Ruby 
* Cuando se invoca el método `new`, Ruby aloca memoria para alojar un objeto no
  inicializado y luego invoca al método `initialize` **pasándole cada parámetro
  que fue enviado a `new`**
* Entonces `initialize` nos permite configurar el estado inicial de nuestros objetos

!SLIDE smbullets small transition=uncover
# Continuamos analizando `initialize`

* Vemos que se utilizan variables de instancia: 
  * Comienzan con **@**
  * Esto permite que los valores recibidos como parámetros no se pierdan luego
    de ejecutar `initialize`
  * Por ello almacenamos estos valores en variables de instancia
* Podríamos pensar que `@isbn` e `isbn` están relacionadas, pero:
  * No hay relación alguna más que coinciden en el nombre
  * Pero ambas son variables diferentes, una con un nombre que comienza con
    **@** y otra **no**
* Notamos además que se realiza una pequeña validación
  * El método
    [`Float`](http://www.ruby-doc.org/core-2.0.0/Kernel.html#method-i-Float)
    toma un argumento y lo convierte a `float`, terminando el programa si falla
    la conversión

*Analizar cómo es que `Float` es un método*

!SLIDE smbullets smaller transition=uncover
# Usamos los nuevos objetos

	@@@ ruby
	b1 = BookInStock.new("isbn1", 3)
	p b1
	b2 = BookInStock.new("isbn2", 3.14)
	p b2
	b3 = BookInStock.new("isbn3", "5.67")
	p b3

* Usamos el método `p` porque imprime el estado interno de los objetos. 
* `puts` por defecto imprime `#<nombre_de_clase:id_objeto_en_hex>`
	* `to_s`, que es enviado a cualquier objeto que necesita convertirse a `string` 

## Agregamos `to_s`

	@@@ ruby 
	class BookInStock
		def to_s
			"ISBN: #{@isbn}, price: #{@price}"
		end
	end


!SLIDE smbullets smaller transition=uncover
# Objetos y sus atributos
* Un objeto como el mostrado anteriormente no permite que nadie acceda a sus
  variables
* Si bien es algo positivo encapsular, si no permitimos acceder a los datos que
  mantienen el estado del objeto, el mismo se vuelve inútil.
* A las *ventanas* de acceso a los objetos las denominaremos **atributos**
* Modificaremos nuestra clase de `BookInStock` con el fin de agregar atributos
  para `isbn` y `price` así podemos contabilizarlos

## Deifinición de los atributos:

	@@@ ruby
	class BookInStock
		def isbn
			@isbn 
		end

		def price
			@price
		end
	end
	

!SLIDE smbullets smaller transition=uncover
# Acceso a los atributos
* A los atributos anteriores se los denomina `accesor` porque mapean
  directamente con las variables de instancia
* Como escribir accesors es algo común, Ruby provee un shortcut: `attr_reader`

## Usando `attr_reader`

	@@@ ruby 
	class BookInStock
		attr_reader :isbn, :price

		def initialize(isbn, price)
			@isbn = isbn
			@price = Float(price)
		end
		# ..
	end

* Notar que se utilizan **símbolos para los nombres de los métodos**
* Suele confundirse con determinadas funciones presentes en otros lenguajes que
  `attr_reader` define variables de instancia, y **no lo hace**
  * Sólo los métodos de acceso como los que definimos inicialmente


!SLIDE smbullets small transition=uncover
# Atributos de escritura
* No sólo leemos atributos: a veces necesitamos modificar un valor
* Ruby permite modificar atributos definiendo un método terminado con **el signo
  igual**:

## Agregamos `price=`

	@@@ ruby
	class BookInStock
		attr_reader :isbn, :price
		
		def initialize(isbn, price)
			@isbn = isbn
			@price = Float(price)
		end
		
		def price=(new_price)
			@price = new_price
		end
		# ...
	end

!SLIDE smbullets smaller transition=uncover
# Atributos de escritura

	@@@ ruby
	book = BookInStock.new("isbn1", 33.80)
	puts "ISBN = #{book.isbn}"
	puts "Price = #{book.price}"
	book.price = book.price * 0.75 # discount price
	puts "New price = #{book.price}"


* Al igual que con `attr_reader` ruby provee un shortcut para accessors de
  sólo escritura: `attr_writer` (raramente usado)
* Es más común utilizar `attr_accessor` que provee acceso R/W

## La clase definitiva:

	@@@ ruby
	class BookInStock

		attr_reader :isbn
		attr_accessor :price

		def initialize(isbn, price)
			@isbn = isbn
			@price = Float(price)
		end
	end

!SLIDE smbullets smaller transition=uncover
# Atributos virtuales

## Agregamos el precio en centavos

	@@@ ruby
	class BookInStock
		attr_reader :isbn
		attr_accessor :price
	
		def initialize(isbn, price)
			@isbn = isbn
			@price = Float(price)
		end
	
		def price_in_cents
			Integer(price*100 + 0.5)
		end
	
		def price_in_cents=(cents)
			@price = cents / 100.0
		end
		# ...
	end

* Notamos que no hay correspondencia con variables de instancia como es el caso 
  de `price` e `isbn`
* Pero el mapeo es con `price`

!SLIDE smbullets smaller transition=uncover
# El lector de CSV
* Repasamos qué debe realizar el programa a desarrollar:
  * Leer varios archivos CSV
  * Totalizar ejemplares iguales
  * Totalizar el precio de los libros en stock

## El esqueleto de `CsvReader`

	@@@ ruby
	class CsvReader
		def initialize
			# ...
		end
	
		def read_in_csv_data(csv_file_name)
		# ...
		end
	
		def total_value_in_stock
		# ...
		end
	
		def number_of_each_isbn
		# ...
		end
	end

!SLIDE smbullets small transition=uncover
# ¿Cómo usríamos CsvReader?

	@@@ ruby
	reader = CsvReader.new
	reader.read_in_csv_data("file1.csv")
	reader.read_in_csv_data("file2.csv")
	:				:				:
	puts "Total value in stock = \
		#{reader.total_value_in_stock}"

* Notamos que `CsvReader` debe ir acumulando lo que va leyendo de cada csv
* Para ello mantendremos un arreglo de valores como variable de instancia
* Para leer un CSV, Ruby provee de una simple librería que simplificará el
  trabajo

!SLIDE smbullets smaller transition=uncover
# Comportamiento de CsvReader
	@@@ ruby
	require 'csv'
	
	class CsvReader
	
		def initialize
			@books_in_stock = []
		end
	
		def read_in_csv_data(csv_file_name)
			CSV.foreach(csv_file_name, headers: true) do |row|
				@books_in_stock << 
					BookInStock.new(row["ISBN"], row["Amount"])
			end
		end
	end

* En `read_in_csv_data` la primer línea indica la apertura del archivo
  `csv_file_name` y el parámetro `headers: true` indica a la librería que la
  primer línea del archivo son los encabezados de cada columna o campo
* La librería pasará entonces cada fila leída al bloque mostrado. Notar que el
  acceso a cada campo se corresponde con los **nombres de las columnas**

!SLIDE smbullets transition=uncover
# Calculando el precio total
	@@@ ruby
	class CsvReader

		# Luego veremos como usar inject...
		def total_value_in_stock
			sum = 0.0
			@books_in_stock.each do |book| 
				sum += book.price
			end
			sum
		end

	end

!SLIDE bullets smaller transition=uncover
# Fragmentación de un programa
* Dividimos el código en tres archivos
  * `book_in_stock.rb`: contendrá la clase `BookInStock`
  * `csv_reader.rb`: será el código de `CsvReader`
  * `stock_stats.rb`: será el programa principal
* Aparecerán dependencias entre ellos
  * Para cargar dependencias externas se utiliza: `require` y `require_relative`

## El programa principal `stock_stats.rb`

	@@@ ruby
	require_relative 'csv_reader'
	
	reader = CsvReader.new
	ARGV.each do |csv_file_name|
		STDERR.puts "Processing #{csv_file_name}"
		reader.read_in_csv_data(csv_file_name)
	end
	
	puts "Total value = #{reader.total_value_in_stock}"

!SLIDE center transition=uncover
# Control de acceso

!SLIDE bullets small transition=uncover
# Control de acceso
* Al diseñar la interfaz de una clase es importante definir qué publicaremos al
  mundo
* Permitir demasiado acceso a nuestras clases, incrementará el riesgo de
 **acoplamiento** de la aplicación
  * Los usuarios de una clase que se expone demasiado podrían confiar en
    detalles de implementación en vez de su interfaz lógica
* Ruby provee control de acceso a los métodos (que son quienes permitirían
  alterar el estado de un objeto)
* Una regla importante es:
  * Nunca exponer métodos que puedan dejar un objeto en estado inválido

!SLIDE bullets small transition=uncover
# Niveles de protección
* **Públicos:** los métodos públicos pueden invocarse por cualquiera (no hay
  control de acceso). Los métodos son públicos por defecto excepto initialize que
  siempre es privado.
* **Protegidos:** pueden invocarse sólo por objetos de la clase que lo define y 
  sus subclases. El acceso queda en la familia.
* **Privados:** estos métodos no pueden ser invocados con un receptor explícito: 
  *el receptor es siempre el objeto actual, mejor conocido como `self`*. Esto
  significa que tampoco puede invocar el método privado de otra instancia de la
  misma clase.

!SLIDE bullets smaller transition=uncover
# Aplicando accesos

	@@@ ruby
	class MyClass
		def method 	#default is public
		#...
		end
	
		protected 	# subsequent methods will be 'protected'

		def method2
		#...
		end
	
		private 	# subsequent methods will be 'private'

		def method3
		#...
		end
	
		public 		# subsequent methods will be 'public'

		def method4
		#...
		end
	end
!SLIDE bullets transition=uncover
# Alternativamente

	@@@ ruby
	class MyClass
		def method1
		end

		public :method1, :method4
		protected :method2
		private :method3
	end

!SLIDE smbullets transition=uncover
# Variables
* Hemos usado variables en varias oportunidades
* Se usan para no perder valores y poder referenciarlos nuevamente
* Cada variable es una **referencia** a un objeto
* Son lo único que no son objetos en ruby: 

*Is a variable an object?* ***In Ruby, the answer is no.*** *A variable is simply a
reference to an object. Objects float around in a big pool somewhere (the heap, most of the
time) and are pointed to by variables.*

!SLIDE smbullets transition=uncover
# Variables como alias
## Analicemos el siguiente ejemplo

	@@@ ruby
	person1 = "Tim"
	person2 = person1
	person1[0] = 'J'
	puts "person1 is #{person1}"
	puts "person2 is #{person2}"

## Para evitarlo: `dup`

	@@@ ruby
	person1 = "Tim"
	person2 = person1.dup
	person1[0] = 'J'
	puts "person1 is #{person1}"
	puts "person2 is #{person2}"

!SLIDE smbullets transition=uncover
# Freezando un objeto
## Es posible freezar objetos

	@@@ ruby
	person1 = "Tim"
	person2 = person1
	person1.freeze
	person2[0] = 'J'

