class AddTripPlanRefToItinerary < ActiveRecord::Migration[5.1]
  def change
    add_reference :itineraries, :trip_plan, foreign_key: true
  end
end
