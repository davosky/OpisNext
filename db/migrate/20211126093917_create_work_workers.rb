class CreateWorkWorkers < ActiveRecord::Migration[6.1]
  def change
    create_table :work_workers do |t|
      t.string :name
      t.integer :position

      t.timestamps
    end
  end
end
