class PagesController < ApplicationController
  def welcome
  	@products = Product.order("name ASC")
  	@orders = Order.all
  	@users = User.order("last_name ASC")
  	@warehouses = Warehouse.all
  end
end
