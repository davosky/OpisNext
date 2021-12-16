class CreateGenericOffices < ActiveRecord::Migration[6.1]
  def change
    create_table :generic_offices do |t|
      t.string :name
      t.integer :position

      t.timestamps
    end
  end
end
