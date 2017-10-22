class StoreController < ApplicationController
  
  def index 
  	@categories = Category.all
  	@items = Item.available_items
  	@user = current_user if user_signed_in?
  	# binding.pry
  end

end
