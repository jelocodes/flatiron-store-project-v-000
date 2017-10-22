class LineItemsController < ApplicationController

	def create 
		current_user.update(cart_id: current_user.carts.create.id) if current_user.current_cart == nil 
		existing_item = current_user.current_cart.items.detect{|item| item.id == params[:item_id].to_i}
		if !!existing_item
			# existing_item.line_items.each{|line_item| line_item.update(quantity: line_item.quantity+=1) if line_item.item_id == params[:item_id]}
			# current_cart.line_items.first.quantity
			current_user.current_cart.line_items.each{|line_item| line_item.update(quantity: line_item.quantity+=1) if line_item.item_id == params[:item_id].to_i}
		else
			LineItem.create(cart_id: current_user.current_cart.id, item_id: params[:item_id], quantity: 1) 
		end
		# binding.pry
		redirect_to cart_path(current_user.current_cart.id)
	end
	
end
