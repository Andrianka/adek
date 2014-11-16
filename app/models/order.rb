class Order < ActiveRecord::Base
	belongs_to :user
	has_many :products
	has_many :order_items

	accepts_nested_attributes_for :order_items

	STATUS = [New = 'new', Done = 'done', Todo = 'todo']
end
