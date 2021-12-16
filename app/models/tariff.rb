class Tariff < ApplicationRecord
  belongs_to :category

  before_create :set_name
  def set_name
    last_name = Tariff.maximum(:name)
    self.name = last_name.to_i + 1
  end

  validates :category_id, presence: true
  validates :typology, presence: true
  validates :amount, presence: true
end
