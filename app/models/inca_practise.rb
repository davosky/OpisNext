# frozen_string_literal: true

class IncaPractise < ApplicationRecord
  has_many :inca_subscriptions

  validates :name, presence: true
  validates :position, presence: true
end
