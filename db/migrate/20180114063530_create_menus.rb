class CreateMenus < ActiveRecord::Migration
  def change
    create_table :menus do |t|
      t.string :dish_name
      t.string :dish_description
      t.decimal :dish_price
      t.references :restaurant_system, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
