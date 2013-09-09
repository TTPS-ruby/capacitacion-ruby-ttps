!SLIDE center transition=uncover
# Expresiones
!SLIDE center transition=uncover
## En Ruby casi todo retorna un valor 

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
	# => nil

Notar que la definición de un método retorna nil

**Su ejecución retorna `"bar"`**

