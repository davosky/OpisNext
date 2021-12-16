class CreateSubscriptionYears < ActiveRecord::Migration[6.1]
  def change
    create_table :subscription_years do |t|
      t.string :name
      t.integer :position

      t.timestamps
    end
  end
end
