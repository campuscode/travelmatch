class TouristSpotsController < ApplicationController
  def new
    @itinerary = Itinerary.find(params[:itinerary_id])
    @tourist_spot = TouristSpot.new
  end

  def create
    itinerary = Itinerary.find(params[:itinerary_id])
    tourist_spot = TouristSpot.new(tourist_spot_params)
    itinerary.activities << tourist_spot
    redirect_to trip_plan_itinerary_path(tourist_spot.itinerary.trip_plan.id,
                                         tourist_spot.itinerary.id)
  end

  private

  def tourist_spot_params
    params.require(:tourist_spot).permit(:title, :comment, :location,
                                         :activity_date, :spot_type, :value)
  end
end
