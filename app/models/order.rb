class Order < ActiveRecord::Base
	belongs_to :user
	has_many :products
	has_many :order_items

	accepts_nested_attributes_for :order_items

	include OrdersHelper

	STATUS = [New = 'new', Done = 'done', Todo = 'todo']

	def sum_price_net(sum=0)
		self.order_items.each do |p|
			sum += p.price * p.quantity unless p.price.nil? || p.quantity.nil?
		end
		return sum
	end


	def sum_price_vat_value(sum=0)
		@n_w=0
		self.order_items.each do |p|
			sum += vat_value(p.product.vat, p.price, p.quantity) unless p.product.vat.nil?
		end
		@n_w = sum
		return sum
	end

	def sum_net_worth(sum=0)
		self.order_items.each do |p|
			sum += net_worth(p.price, p.quantity) + @n_w
		end
		return sum
	end

end
