class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :product_id
      t.integer :user_id
      t.string :status
      t.integer :price

      t.timestamps
    end
  end
end
