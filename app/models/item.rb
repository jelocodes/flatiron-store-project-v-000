class Item < ActiveRecord::Base
	has_many :line_items
	belongs_to :category

	def self.available_items 
		@new_array = self.all.collect do |item|
			item if item.inventory != 0
		end
		@new_array.compact
	end
end
