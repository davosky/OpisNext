class GenericSubscription < ApplicationRecord
  belongs_to :generic_office
  belongs_to :subscription_typology
  belongs_to :sex
  belongs_to :company_typology, optional: true
  belongs_to :work_qualify, optional: true
  belongs_to :work_level, optional: true
  belongs_to :work_worker, optional: true
  belongs_to :payment_typology
  belongs_to :category
  belongs_to :subscription_year
  belongs_to :generic_practise
  belongs_to :privacy_one
  belongs_to :privacy_two
  belongs_to :privacy_three
  belongs_to :user

  has_one_attached :pdf

  before_create :set_name
  def set_name
    last_name = GenericSubscription.maximum(:name)
    self.name = last_name.to_i + 1
  end

  validates :customer_name, presence: true
  validates :customer_forname, presence: true
  validates :customer_birth_place, presence: true
  validates :customer_birth_date, presence: true
  validates :customer_fiscal_code, presence: true
  validates :sex_id, presence: true
  validates :customer_address, presence: true
  validates :customer_zip, presence: true
  validates :customer_city, presence: true
  validates :customer_province, presence: true
  validates :customer_nationality, presence: true
  validates :payment, presence: true
  validates :payment_typology_id, presence: true
  validates :generic_office_id, presence: true
  validates :generic_practise_id, presence: true
  validates :subscription_year, presence: true
  validates :category_id, presence: true
  validates :privacy_one, presence: true
  validates :privacy_two, presence: true
  validates :privacy_three, presence: true
  validates :cancellation_reason, if: -> { cancellation == true }, presence: true
end
