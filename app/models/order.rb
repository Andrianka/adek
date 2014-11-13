class Order < ActiveRecord::Base
	belongs_to :user
	has_many :products, :through => :order_product_association
	has_many :order_product_association
end
