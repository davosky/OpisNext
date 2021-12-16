class CreateWorkQualifies < ActiveRecord::Migration[6.1]
  def change
    create_table :work_qualifies do |t|
      t.string :name
      t.integer :position

      t.timestamps
    end
  end
end
