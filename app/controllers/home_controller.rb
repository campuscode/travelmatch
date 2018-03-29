class HomeController < ApplicationController
  def index
    @trip_plans = TripPlan.order(created_at: :desc).limit(4)
  end
end
