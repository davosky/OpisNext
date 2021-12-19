class CreateIncaSubscriptions < ActiveRecord::Migration[6.1]
  def change
    create_table :inca_subscriptions do |t|
      t.bigint :inca_office_id
      t.bigint :subscription_typology_id
      t.string :customer_name
      t.string :customer_forname
      t.bigint :sex_id
      t.string :customer_birth_place
      t.date :customer_birth_date
      t.string :customer_fiscal_code
      t.string :customer_nationality
      t.string :customer_address
      t.string :customer_zip
      t.string :customer_city
      t.string :customer_province
      t.string :customer_phone
      t.string :customer_mobile
      t.string :customer_email
      t.string :company_vat_number
      t.string :company_fiscal_code
      t.string :company_name
      t.string :company_address
      t.string :company_zip
      t.string :company_city
      t.string :company_province
      t.bigint :company_typology_id
      t.bigint :work_qualify_id
      t.bigint :work_level_id
      t.string :work_contract
      t.bigint :work_worker_id
      t.date :work_employee_date
      t.string :work_workplace
      t.decimal :payment, precision: 8, scale: 2, default: 0.0
      t.bigint :payment_typology_id
      t.bigint :category_id
      t.bigint :subscription_year_id
      t.bigint :inca_practise_id
      t.bigint :privacy_one_id
      t.bigint :privacy_two_id
      t.bigint :privacy_three_id
      t.text :note
      t.boolean :cancellation
      t.string :cancellation_reason
      t.integer :name
      t.date :date
      t.string :institute
      t.bigint :user_id

      t.timestamps
    end
  end
end
