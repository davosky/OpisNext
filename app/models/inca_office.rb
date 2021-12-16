# frozen_string_literal: true

class IncaOffice < ApplicationRecord
  has_many :inca_receipts
  has_many :inca_subscriptions

  validates :name, presence: true
  validates :position, presence: true
end
