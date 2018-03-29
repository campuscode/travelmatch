class AddSlugToTripPlan < ActiveRecord::Migration[5.1]
  def change
    add_column :trip_plans, :slug, :string
  end
end
