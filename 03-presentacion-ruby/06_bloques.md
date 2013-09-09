!SLIDE center transition=uncover
# Bloques
!SLIDE bullets transition=uncover
# Rara vez usaremos un for / while
	@@@ ruby
	3.times do |i|
		puts i
	end
	# 0
	# 1
	# 2
	# => 3 (retorna el 3 que recibe .times)
	
	3.times { |x| puts x }
