class RestaurantSystem < ActiveRecord::Base
  has_many :customers, dependent: :destroy
  has_many :invoices, dependent: :destroy
  validates :name, :phone, :address, presence: true
  validates :phone, length: {in: 10..15}
end