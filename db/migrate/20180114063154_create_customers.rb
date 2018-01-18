class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :name
      t.string :phone
      t.string :address
      t.integer :no_of_people
      t.references :restaurant_system, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
