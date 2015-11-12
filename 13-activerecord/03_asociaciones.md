!SLIDE center transition=uncover
# Active Record: asociaciones

!SLIDE bullets small transition=uncover
# Introducción
* Las asociaciones simplifican la interacción entre modelos relacionados

## Asumamos los siguientes modelos

	@@@ruby
	class Customer < ActiveRecord::Base
	end
	 
	class Order < ActiveRecord::Base
	end

!SLIDE bullets small transition=uncover
# Introducción

* Si Los clientes pueden tener varias órdenes, sin asociaciones, la forma de
relacionarlos sería:

## El problema

	@@@ruby
	@order = Order.create(
		order_date: Time.now, 
		customer_id: @customer.id)
	
	# Para eliminar un cliente con sus ordenes:
	@orders = Order.where(customer_id: @customer.id)
	@orders.each do |order|
		order.destroy
	end
	@customer.destroy

!SLIDE bullets small transition=uncover
# La solución

	@@@ruby
	class Customer < ActiveRecord::Base
		has_many :orders, dependent: :destroy
	end
	 
	class Order < ActiveRecord::Base
		belongs_to :customer
	end
	
	# Crear una orden:
	@order = @customer.orders.create(order_date: Time.now)
	
	# Eliminar un cliente:
	@customer.destroy

!SLIDE bullets transition=uncover
# Tipos de asociaciones

* Las asociaciones podrán ser alguna de:
	* `belongs_to`
	* `has_one`
	* `has_many`
	* `has_many :through`
	* `has_one :through`
	* `has_and_belongs_to_many`
