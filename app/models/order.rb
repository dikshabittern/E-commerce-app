class Order < ApplicationRecord
	belongs_to :user, optional: true
	belongs_to :cart
	# has_many :products, through: :order_items
	# 
	# belongs_to :product
	# has_many :order_items

	#  full price of Order item fetch from order_item.rb file 
	# def total_price_of_order_items
	# 	order_items.to_a.sum(&:full_price_of_order_items)
	# end

end