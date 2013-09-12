!SLIDE center transition=uncover
# Módulos
!SLIDE bullets transition=uncover
# Como Namespace
	@@@ ruby
	module MyAPI
		class User
		...
		end
	
		def self.configuration
		...
		end
	end
	
	user = MyAPI::User.new
	
	puts MyAPI::configuration
	


!SLIDE smbullets transition=uncover
# Como Mixins

*Como las interfaces, pero con comportamiento*

	@@@ ruby
	module MyLog
		def log(msg)
			puts "Log: #{msg}"
		end
	end

!SLIDE smbullets transition=uncover
# Como usar un mixin

	@@@ ruby
	class String; include MyLog; end
	
	"hola".log("pepe")
	#Log: pepe
	# => nil 

