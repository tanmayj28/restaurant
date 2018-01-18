class Customer < ActiveRecord::Base
  belongs_to :restaurant_system
  has_many :invoices, dependent: :destroy
  has_many :orders, dependent: :destroy
  validates :name, :phone, :address, :no_of_people, presence: true
  validates :phone, length: {in: 10..15}
  validates :no_of_people, numericality: { only_integer: true }
end