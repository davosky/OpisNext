class CreateCategories < ActiveRecord::Migration[6.1]
  def change
    create_table :inca_offices do |t|
      t.string :name
      t.integer :position

      t.timestamps
    end
  end
end
