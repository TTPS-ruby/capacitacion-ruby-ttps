!SLIDE center transition=uncover
# Hay muchos literales
!SLIDE bullets transition=uncover
# Números literales
	@@@ ruby
	3
	3.14
	1_999_235_243_888 == 1999235243888

## Podemos usar binario, octal o hexadecimal

	@@@ ruby
	0b1000_1000 	#Binario => 132
	010 				# Octal => 8
	0x10 				# Decimal => 16

!SLIDE bullets execute transition=uncover
# Strings literales

	@@@ ruby
	'sin interpolar'
	"Interpolando: #{'Ja'*3}!"

## Podemos usar otras formas
	@@@ ruby
	%q/Hola/
	%q!Chau!
	%Q{Interpolando: #{3+3}}

!SLIDE bullets execute transition=uncover
# Strings como here document

	@@@ ruby
	
	un_string = <<EOS
		Este es un texto
		de mas de una linea
		que termina aqui
	EOS
	
	un_string.upcase

!SLIDE bullets small transition=uncover
# Símbolos
* Son como variables prefijados con **:** (dos puntos)
  * Ejemplos: `:action`, `:line_items`, `:+`
* No es necesario declararlos 
* Se garantiza que son únicos
  * No es necesario asignarles ningún valor

## Veamos un ejemplo

	@@@ ruby 
	:uno.object_id 	# siempre devolverá lo mismo
	"uno".object_id	# siempre devolverá diferente

!SLIDE bullets transition=uncover
# Arreglos
	@@@ ruby 
	
	['Hola', 'Chau]
	
	%w(Hola Chau #{2+2})	# sin interpolar
	
	%W(Hola Chau #{2+2})	# interpolando
	
	[1,2,3,4]
	

!SLIDE bullets transition=uncover
# Hashes
	@@@ ruby 
	# Versión 1.8
	{
		:nombre 	=> 'Christian',
		:apellido 	=> 'Rodriguez'
	}
	# Versión > 1.8
	{
		nombre: 	'Christian',
		apellido: 	'Rodriguez'
	}

!SLIDE bullets transition=uncover
# Expresiones regulares
	@@@ ruby 
	/^[a-zA-Z]+$/


*Explicación detallada en
[Pickaxe](http://www.ruby-doc.org/docs/ProgrammingRuby/html/language.html#UJ)*

*Para probar expresiones regulares puede usar [Rubular](http://rubular.com/)*

!SLIDE bullets transition=uncover
# Rangos
	@@@ ruby 
	0..1
	0..10
	"a".."z"
	"a"..."z"

## Pueden convertirse en arreglos
	@@@ ruby 
	("a"..."z").to_a

## Rangos como intervalos
	@@@ ruby 
	(1..10) === 5	# => true
	(1..10) === 15	 # => false
	(1..10) === 3.1	 # => true

!SLIDE bullets transition=uncover
# Lambdas

	@@@ ruby 
	uno	= lambda { |n| n * 2 }
	
	dos	= ->(n, m){ n * 2 + m }
	
	tres	= ->(n=0, m){ n * 2 + m}
	
	# Entonces
	uno.call 2 	 		# => 4
	
	dos.call 2,3		# => 7
	
	tres.call 2 		# => 4

