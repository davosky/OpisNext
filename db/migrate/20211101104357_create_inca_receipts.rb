class CreateIncaReceipts < ActiveRecord::Migration[6.1]
  def change
    create_table :inca_receipts do |t|
      t.references :inca_office, null: false, foreign_key: true
      t.string :customer_name
      t.string :customer_forname
      t.string :customer_birth_place
      t.date :customer_birth_date
      t.string :customer_fiscal_code
      t.string :customer_address
      t.string :customer_zip
      t.string :customer_city
      t.string :customer_province
      t.decimal :payment, precision: 8, scale: 2, default: 0
      t.references :payment_typology, null: false, foreign_key: true
      t.text :note
      t.integer :name
      t.date :date
      t.references :user, null: false, foreign_key: true
      t.string :institute

      t.timestamps
    end
  end
end
