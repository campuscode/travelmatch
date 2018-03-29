class AccommodationsController < ApplicationController
  def new
    @itinerary = Itinerary.find(params[:itinerary_id])
    @accommodation = Accommodation.new
  end

  def create
    itinerary = Itinerary.find(params[:itinerary_id])
    accommodation_params = params.require(:accommodation).permit(:title, :comment, :location,
      :activity_date, :accommodation_type, :daily_value)
    accommodation = Accommodation.new(accommodation_params)
    itinerary.activities << accommodation
    redirect_to trip_plan_itinerary_path(accommodation.itinerary.trip_plan.id, accommodation.itinerary.id)
  end
end
