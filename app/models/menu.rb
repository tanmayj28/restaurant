class Menu < ActiveRecord::Base
  belongs_to :restaurant_system
  has_many :orders
  validates :dish_name, :dish_description, :dish_price, presence: true
  validates :dish_price, format: { with: /\A\d+(?:\.\d{0,2})?\z/ }, numericality: { greater_than: 0, less_than: 100000 }
end 