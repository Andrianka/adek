class AddColumnsToOrders < ActiveRecord::Migration
  def change
  	add_column :orders, :deadline_at, :datetime
  	add_column :orders, :descripton, :text
  end
end
