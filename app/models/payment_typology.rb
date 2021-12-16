# frozen_string_literal: true

class PaymentTypology < ApplicationRecord
  has_many :inca_receipts
  has_many :inca_subscriptions
  has_many :generic_subscriptions

  validates :name, presence: true
  validates :position, presence: true
end
