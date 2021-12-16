class IncaReceipt < ApplicationRecord
  belongs_to :inca_office
  belongs_to :payment_typology
  belongs_to :user

  has_one_attached :pdf

  before_create :set_name
  def set_name
    last_name = IncaReceipt.maximum(:name)
    self.name = last_name.to_i + 1
  end

  validates :date, presence: true
  validates :user_id, presence: true
  validates :institute, presence: true
  validates :inca_office_id, presence: true
  validates :customer_name, presence: true
  validates :customer_forname, presence: true
  validates :customer_birth_place, presence: true
  validates :customer_birth_date, presence: true
  validates :customer_fiscal_code, presence: true
  validates :customer_address, presence: true
  validates :customer_zip, presence: true
  validates :customer_city, presence: true
  validates :customer_province, presence: true
  validates :payment, presence: true
  validates :payment_typology_id, presence: true
  validates :cancellation_reason, if: -> { cancellation == true }, presence: true
end
