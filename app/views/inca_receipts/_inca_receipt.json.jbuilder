json.extract! inca_receipt, :id, :inca_office_id, :customer_name, :customer_forname, :customer_birth_place, :customer_birth_date, :customer_fiscal_code, :customer_address, :customer_zip, :customer_city, :customer_province, :payment, :payment_typology_id, :note, :name, :date, :user_id, :institute, :created_at, :updated_at
json.url inca_receipt_url(inca_receipt, format: :json)
