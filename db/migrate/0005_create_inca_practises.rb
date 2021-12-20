class CreateIncaPractises < ActiveRecord::Migration[6.1]
  def change
    create_table :inca_practises do |t|
      t.string :name
      t.integer :position

      t.timestamps
    end
  end
end
