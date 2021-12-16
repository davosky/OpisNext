class CreateWorkLevels < ActiveRecord::Migration[6.1]
  def change
    create_table :work_levels do |t|
      t.string :name
      t.integer :position

      t.timestamps
    end
  end
end
