!SLIDE center transition=uncover
# Monkey patching
!SLIDE bullets transition=uncover
# ¿Qué es monkey patching?
* Modificar una clase dinámicamente
* En tiempo de ejecución, agregar nuevos métodos a una clase o cambiar su
  comportamiento
* El término surge de **Gorilla Patch** 
  * *Monkey patch es menos intimidante*

!SLIDE smbullets transition=uncover
# Un ejemplo
	@@@ ruby
	(1..10).even # da error: even no existe
	
	class Range
		# Agregamos even a Range
		def even
		  self.select(&:even?)  
		end
	end
	
	(1..10).even # ahora no da error
	# => [2,4,6,8,10]

