class Category < ApplicationRecord
  has_many :inca_subscriptions
  has_many :tariffs

  validates :name, presence: true
  validates :position, presence: true
end
