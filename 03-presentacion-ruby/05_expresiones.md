!SLIDE center transition=uncover
# Expresiones
!SLIDE center transition=uncover
## En Ruby toda expresión retorna un valor 

!SLIDE execute transition=uncover
# En estos casos retorna el valor esperado

	@@@ ruby
	a = 3.14

## Veamos como es el case

	@@@ ruby
	estado = nil
	#...
	face = 	case estado
					when "Feliz"  then ":)"
					when "Triste" then ":("
					else               ":|"
	end

!SLIDE execute incremental transition=uncover
# Y en este caso, ¿qué retorna?

	@@@ ruby
	def foo
		"bar"
	end

En versiones previas a la 2.0 retorna *nil*, en versiones superiores el símbolo
con el nombre del método

	@@@ ruby
	RUBY_VERSION
	def foo; end

**Su ejecución retorna `"bar"`**

