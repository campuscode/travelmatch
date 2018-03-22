class CreateItineraries < ActiveRecord::Migration[5.1]
  def change
    create_table :itineraries do |t|
      t.string :location
      t.string :season
      t.date :start_date
      t.date :end_date

      t.timestamps
    end
  end
end
