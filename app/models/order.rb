class Order < ActiveRecord::Base
	belongs_to :user
	has_many :products
	has_many :order_items

	accepts_nested_attributes_for :order_items



	STATUS = [New = 'new', Done = 'done', Todo = 'todo']

	def sum_price(sum=0)
		self.order_items.each do |p|
			sum += p.price * p.quantity unless p.price.nil? || p.quantity.nil?
		end
		return sum
	end

end
