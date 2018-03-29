class CreateTripPlans < ActiveRecord::Migration[5.1]
  def change
    create_table :trip_plans do |t|
      t.string :title
      t.date :start_date
      t.date :end_date
      t.text :description
      t.timestamps
    end
  end
end
