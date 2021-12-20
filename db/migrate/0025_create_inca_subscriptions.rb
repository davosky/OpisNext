class CreateIncaSubscriptions < ActiveRecord::Migration[6.1]
  def change
    create_table :inca_subscriptions do |t|
      t.integer :name
      t.text :note
      t.boolean :cancellation
      t.string :cancellation_reason
      t.date :date
      t.string :institute
      t.string :customer_name
      t.string :customer_forname
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
      t.string :work_contract
      t.date :work_employee_date
      t.string :work_workplace
      t.decimal :payment, precision: 8, scale: 2, default: 0.0
      t.references :inca_office, null: false, foreign_key: true
      t.references :subscription_typology, null: false, foreign_key: true
      t.references :sex, null: false, foreign_key: true
      t.references :company_typology, null: false, foreign_key: true
      t.references :work_qualify, null: false, foreign_key: true
      t.references :work_level, null: false, foreign_key: true
      t.references :work_worker, null: false, foreign_key: true
      t.references :payment_typology, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true
      t.references :subscription_year, null: false, foreign_key: true
      t.references :inca_practise, null: false, foreign_key: true
      t.references :privacy_one, null: false, foreign_key: true
      t.references :privacy_two, null: false, foreign_key: true
      t.references :privacy_three, null: false, foreign_key: true

      t.timestamps
    end
  end
end