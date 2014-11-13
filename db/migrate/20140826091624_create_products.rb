class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.integer :product_key
      t.string :name
      t.integer :price

      t.timestamps
    end
  end
end
