class CreateTariffs < ActiveRecord::Migration[6.1]
  def change
    create_table :tariffs do |t|
      t.integer :name
      t.references :category, null: false, foreign_key: true
      t.integer :position
      t.string :typology
      t.decimal :amount, precision: 8, scale: 2, default: 0.0

      t.timestamps
    end
  end
end
