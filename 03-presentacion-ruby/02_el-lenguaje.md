!SLIDE center transition=uncover
# El lenguaje

!SLIDE bullets incremental transition=uncover
# Características
* Dinámico
* Sintaxis concisa y expresiva 
* Orientado a objetos
* Capacidades de metaprogramación
* Características funcionales

!SLIDE center transition=uncover
# Entendiendo Ruby

!SLIDE smbullets transition=uncover
# Sintaxis y convenciones

	@@@ ruby
	
		NombreDeClaseOModulo
	
		CONSTANTE
	
		@nombre_de_atributo
	
		@@atributo_de_clase
	
		$variable_global
	
		nombre_de_metodo
	
		metodo_peligroso!
	
		metodo_que_pregunta?
	

!SLIDE bullets execute transition=uncover
# Objetos
## Todos los valores son **objetos**

	@@@ ruby
	"Aprendiendo ruby".length

!SLIDE bullets execute transition=uncover
# Algunos ejemplos más

## Arreglos

	@@@ ruby
	["Mateo", "Lola", "Lihue", "Clio"].sort

## Números

	@@@ ruby
	-100.abs

## nil

	@@@ ruby
	nil.nil?

!SLIDE bullets execute transition=uncover
# Más ejemplos
## Todo es un objeto: parte 2
	@@@ ruby
	1.object_id

## Todo es un objeto: parte 3
	@@@ ruby
	nil.object_id

## Es simple y conciso
	@@@ ruby
	([1,2,3] + [4,5,6]).last
