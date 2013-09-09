!SLIDE center transition=uncover
# Métodos como operadores
!SLIDE execute transition=uncover
# ¿Cómo?
	@@@ ruby
	10 - 2

## Es equivalente a:
	@@@ ruby
	10.send :-, 2

!SLIDE execute transition=uncover
# Otros métodos como operadores
	@@@ ruby
	[1,2,3] - [1]

