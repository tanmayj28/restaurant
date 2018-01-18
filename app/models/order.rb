class Order < ActiveRecord::Base
  belongs_to :menu
  belongs_to :customer
  has_many :invoices, dependent: :destroy
  validates :dish_name, :dish_price, presence: true
  validates :dish_price, format: { with: /\A\d+(?:\.\d{0,2})?\z/ }, numericality: { greater_than: 0, less_than: 1000000 }
end