class CreateActivities < ActiveRecord::Migration[5.1]
  def change
    create_table :activities do |t|
      t.string :title
      t.string :comment
      t.string :location
      t.date :activity_date
      t.references :itinerary, foreign_key: true

      t.timestamps
    end
  end
end
