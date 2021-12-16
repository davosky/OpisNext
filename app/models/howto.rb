# frozen_string_literal: true

class Howto < ApplicationRecord
  validates :title, presence: true
  validates :topic, presence: true
  validates :description, presence: true
end
