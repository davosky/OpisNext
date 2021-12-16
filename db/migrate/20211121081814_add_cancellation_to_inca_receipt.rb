class AddCancellationToIncaReceipt < ActiveRecord::Migration[6.1]
  def change
    add_column :inca_receipts, :cancellation, :boolean
    add_column :inca_receipts, :cancellation_reason, :string
  end
end
