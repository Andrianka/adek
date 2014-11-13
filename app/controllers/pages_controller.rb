class PagesController < ApplicationController
  def welcome
  	@products = Product.order("name ASC").last(10)
  	@orders = Order.last(10)
  	@users = User.order("last_name ASC").last(10)
  	@warehouses = Warehouse.last(10)
  end
end
