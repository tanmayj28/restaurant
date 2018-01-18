class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :dish_name
      t.decimal :dish_price
      t.references :menu, index: true, foreign_key: true
      t.references :customer, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
