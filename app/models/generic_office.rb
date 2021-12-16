class GenericOffice < ApplicationRecord
  has_many :generic_subscriptions

  validates :name, presence: true
  validates :position, presence: true
end
