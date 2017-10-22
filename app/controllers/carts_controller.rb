class CartsController < ApplicationController
	def show
		@cart = current_user.current_cart 
	end

	def checkout
		@cart = Cart.find(params[:id])
		@cart.line_items.each do |line_item| 
			line_item.item.update(inventory: line_item.item.inventory -= line_item.quantity)
		end
		@cart.update(status: 'Submitted')
		current_user.update(cart_id: nil) 
 		redirect_to cart_path
	end

end
