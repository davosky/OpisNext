class CreateHowtos < ActiveRecord::Migration[6.1]
  def change
    create_table :howtos do |t|
      t.string :title
      t.string :topic
      t.text :description

      t.timestamps
    end
  end
end
