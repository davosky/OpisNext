# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable, :registerable

  validate :password_complexity

  def password_complexity
    if password.present? && !password.match(/^(?=.*[a-z])(?=.*[A-Z])/)
      errors.add :password, 'La password non è sufficientemente complessa'
    end
  end

  has_many :inca_receipts
  has_many :inca_subscriptions

  validates :name, presence: true
  validates :institute, presence: true
end
