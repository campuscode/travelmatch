class AddUserRefToTripPlan < ActiveRecord::Migration[5.1]
  def change
    add_reference :trip_plans, :user, foreign_key: true
  end
end
