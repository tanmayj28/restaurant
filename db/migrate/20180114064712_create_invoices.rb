class CreateInvoices < ActiveRecord::Migration
  def change
    create_table :invoices do |t|
      t.string :dish_name
      t.decimal :dish_price
      t.decimal :total
      t.references :restaurant_system, index: true, foreign_key: true
      t.references :customer, index: true, foreign_key: true
      t.references :order, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
