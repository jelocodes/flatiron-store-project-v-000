class Cart < ActiveRecord::Base
	has_many :line_items 
	has_many :items, through: :line_items
	belongs_to :user

	def total 
		@total = 0
		self.line_items.each do |line_item| 
			@total += line_item.item.price * line_item.quantity
		end
		@total
	end

	def add_item(item_id)
		@old_item = self.line_items.detect {|item| item.item_id == item_id } 
		if @old_item != nil 
			@old_item.update(item_id: item_id)
			@old_item 
		else 
			@new_line_item = LineItem.new(item_id: item_id, cart_id: self.id, quantity: 1) 
		end
	end
end
