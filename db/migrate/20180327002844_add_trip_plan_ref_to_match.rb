class AddTripPlanRefToMatch < ActiveRecord::Migration[5.1]
  def change
    add_reference :matches, :trip_plan, foreign_key: true
  end
end
