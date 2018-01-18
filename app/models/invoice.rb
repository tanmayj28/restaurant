class Invoice < ActiveRecord::Base
  belongs_to :restaurant_system
  belongs_to :customer
  belongs_to :order
  validates :dish_name, :dish_price, presence: true
  validates :dish_price, format: { with: /\A\d+(?:\.\d{0,2})?\z/ }, numericality: { greater_than: 0, less_than: 100000 }
end 