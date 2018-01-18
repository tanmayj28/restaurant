class CreateRestaurantSystems < ActiveRecord::Migration
  def change
    create_table :restaurant_systems do |t|
      t.string :name
      t.string :phone
      t.string :address

      t.timestamps null: false
    end
  end
end
