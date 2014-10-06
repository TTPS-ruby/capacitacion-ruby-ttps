!SLIDE center transition=uncover
# Expresiones

!SLIDE bullets transition=uncover
# Operadores
* Ya hemos usado los operadores +, -, *, /, etc
* Estos operadores se implementan como llamadas a métodos

## Ejemplo
	@@@ ruby
	a, b, c = 1, 2, 3
	a * b + c
	# O en forma similar
	(a.*(b)).+(c)

!SLIDE bullets transition=uncover
# Operadores
## Podemos redefinirlos incluso
	@@@ ruby
	class Fixnum
		alias old_plus +
		def +(other)
			old_plus(other).succ
		end
	end

!SLIDE bullets small transition=uncover
# Operadores
## Otro ejemplo con `<<`
	@@@ ruby
	class ScoreKeeper
		def initialize
			@total_score = 0
			@count = 0
		end

		def <<(score)
			@total_score += score
			@count += 1
			self
		end
		
		def average
			fail "No scores" if @count == 0
			Float(@total_score) / @count
		end
	end

	scores = ScoreKeeper.new
	scores << 10 << 20 << 40
	puts "Average = #{scores.average}"

!SLIDE bullets small transition=uncover
# Operadores
## Incluso con `[]`
	@@@ ruby
	class SomeClass
		def []=(*params)
			value = params.pop
			puts "Indexed with #{params.join(', ')}"
			puts "value = #{value.inspect}"
		end
	end

	s = SomeClass.new
	s[1] = 2
	s['cat', 'dog'] = 'enemies'


!SLIDE bullets smaller transition=uncover
# Expresiones de comando
* Podemos usar comillas: **\`**  ó `%x` para indicar la ejecución de un comando en el
sistema operativo subyacente

## Ejemplo

	@@@ ruby
	`date`
	`ls`.split[34]
	%x{echo "Hello there"}
	`ip address ls`.
		split("\n").
		select {|x| x =~ / inet / }.
		map do |x|
			x.scan(/((\d{1,3}\.?){4}\/(\d){1,2})/).flatten.shift 
		end
!SLIDE bullets smaller transition=uncover
# Expresiones de asignacion
## Jugando con splat y asignación en paralelo
	@@@ ruby
	a, b, c, d, e = *(1..2), 3, *[4, 5] # a=1, b=2, c=3, d=4, e=5

	a1, *b1 = 1, 2, 3                   # a1=1, b1=[2, 3]

	a2, *b2 = 1                         # a2=1, b2=[]

	*a3, b3 = 1, 2, 3, 4                # a3=[1, 2, 3], b3=4

	c, *d, e = 1, 2, 3, 4               # c=1, d=[2,3], e=4

	f, *g, h, i, j = 1, 2, 3, 4         # f=1, g=[], h=2, i=3, j=4

!SLIDE bullets transition=uncover
# And
* El operador `&&` y el método `and` funcionan similar 
	* Retornan el primer valor si es falso, sino el segundo. Ambos son iguales 
	salvo por la precedencia: `and` es de menor precedencia que `&&`

## Ejemplo
	@@@ ruby
	nil && 99    # => nil
	false && 99  # => false
	"cat" && 99  # => 99
	a = (true and false)
	a = true and false # Check a, Why??

!SLIDE bullets small transition=uncover
# Or
* El operador `||` y el método `or` funcionan similar 
	* Retornan el primer valor si es verdadero, sino el segundo. Ambos son iguales 
	salvo por la precedencia `or` es de menor precedencia que `||`

## Ejemplo
	@@@ ruby
	nil || 99    # => 99
	false || 99  # => 99
	"cat" || 99  # => "cat"
	b = (false or true)
	b = false or true # Check b, Why??

* Es muy común utilizar la expresión: `||=` para setear un valor si no fue
	seteado: `var ||= "default value"`

!SLIDE bullets transition=uncover
# Break, Redo y Next
* Podemos alterar el flujo de ejecución de loops 
	* `break`: termina en forma inmediata al loop en que encuentra más próximo. El
	  control se devuelve a la sentencia siguiente al final del bloque
	* `redo`: repite la iteración actual sin evaluar la condición ni trayendo el
	  siguiente elemento si fuese un iterador
	* `next`: avanza hasta el final del bloque continuando con la siguiente
	  iteración

!SLIDE bullets transition=uncover
# Ejemplos

## Break

	@@@ ruby
	a = 0
	while a < 20 do
		a +=1
		break if a == 10 
		p a 
	end

!SLIDE bullets transition=uncover
# Ejemplos

## Redo

	@@@ ruby
	a = 0
	while a < 20 do
		a +=1
		redo if a == 10 
		p a 
	end
	
	# Y ahora?
	a = 0
	while a < 20 do
		a +=1
		redo if a == 20 
		p a 
	end

!SLIDE bullets transition=uncover
# Ejemplos

## Next

	@@@ ruby
	a = 0
	while a < 20 do
		a +=1
		next if a == 10 
		p a 
	end
	
	# Y ahora?
	a = 0
	while a < 20 do
		a +=1
		next if a == 20 
		p a 
	end
