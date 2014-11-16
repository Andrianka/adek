class ChangeColumnDescriptonToDescription < ActiveRecord::Migration
  def change
  	rename_column :orders, :descripton, :description
  end
end
