!SLIDE center transition=uncover
# Tipos estándar

!SLIDE smbullets small transition=uncover
# Números
* Los números que soporta Ruby son: 
  * Enteros
  * Punto flotante
  * Racionales
  * Complejos
* Los enteros se manejan internamente por Ruby como binarios.
  * Se representan con Fixnum en el rango de (-2^30..2^30-1 o -2^62..2^62-1)
  * Fuera del rango anterior, Ruby utiliza Bignum
  * El proceso es transparente 
* Es importante considerar que los strings no se convierten automáticamente a
  enteros: `'1' + '2' => '12'`

!SLIDE smbullets transition=uncover
# ¿Cómo interactúan?

	@@@ ruby
	1 + 2               # => 3
	1 + 2.0             # => 3.0
	1.0 + 2             # => 3.0
	1.0 + Complex(1,2)  # => (2.0,2i)
	1 + Rational(2,3)   # => (5/3)
	1.0 + Rational(2,3) # => 1.66666666666665

	# Y cuando se divide:

	1.0/2               # => 0.5
	1/2.0               # => 0.5
	1/2                 # => 0

Probar la división requiriendo `mathn`

!SLIDE smbullets small transition=uncover
# Strings y el encoding
* A partir de ruby 1.9, cada string tiene asociada una codificación
* Por defecto, la codificación asociada a un literal string dependerá de la 
  codificación del archivo fuente donde se especificó
	* Sin especificar la codificación de un fuente ruby, se asume: `US-ASCII` en
	  1.9 y `UTF-8` a partir de ruby 2
	* Cambiamos la codificación de un fuente agregando en la primer línea un
	  comentario `#encoding: xxxx` donde xxx corresponde a la codificación

## Un ejemplo
	@@@ ruby
	#encoding: iso-8859-1
	txt = "dog"
	puts "Encoding of #{txt.inspect} is #{txt.encoding}"

!SLIDE bullets small transition=uncover
# Usando rangos como condiciones
* Generalmente usamos rangos como secuencias y dependiendo del tipo del rango
	podíamos pedir: `min`, `max`, `include`, etc
* Ahora veremos una forma de utilizar los rangos como condiciones, de forma tal
	que el objeto rango mantendrá el estado de las comparaciones que macheen desde
	un valor (el inicial del rango) hasta el final (del rango)

## Dos ejemplos
	@@@ ruby 
	100.times {|x| p x if x==50 .. x==55 }

	while line = gets
		puts line if line =~ /start/ .. line =~ /end/
	end

!SLIDE bullets transition=uncover
# Usando rangos como intervalos
	@@@ ruby
	car_age = gets.to_f # let's assume it's 5.2
	case car_age
		when 0...1
			puts "Mmm.. new car smell"
		when 1...3
			puts "Nice and new"
		when 3...6
			puts "Reliable but slightly dinged"
		when 6...10
			puts "Can be a struggle"
		when 10...30
			puts "Clunker"
		else
			puts "Vintage gem"
	end

!SLIDE bullets transition=uncover
# Buscando el problema...
	@@@ ruby
	car_age = gets.to_f # let's assume it's 5.2
	case car_age
		when 0..0
			puts "Mmm.. new car smell"
		when 1..2
			puts "Nice and new"
		when 3..5
			puts "Reliable but slightly dinged"
		when 6..9
			puts "Can be a struggle"
		when 10..29
			puts "Clunker"
		else
			puts "Vintage gem"
	end

