!SLIDE center transition=uncover
# Programando declarativamente
!SLIDE execute transition=uncover
# Ejemplos
## Los pares
	@@@ ruby
	(1..10).select { |n| n.even? }
	
	# o lo que es igual:
	
	(1..10).select(& :even?)

## Procesando cada elemento
	@@@ ruby
	(1..10).map { |n| n*2 }
	
	# o lo que es igual:
	
	(1..10).collect { |n| n*2 }
!SLIDE execute transition=uncover
# Más ejemplos
## Sumatoria

	@@@ ruby
	(1..100).reduce { |sum,n| sum + n }
	
	# o lo que es igual:
	
	(1..100).reduce(:+)

## Lo verificamos:
	@@@ ruby
	# La formula de verificacion es: n*(n+1)/2
	
	100*101/2

!SLIDE transition=uncover
# Aumentando la fluidez
	@@@ ruby
	File.open('my.txt').each do |line|
	
		puts line if line =~ /ruby/
	
	end
