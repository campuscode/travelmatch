class MealsController < ApplicationController
  def new
    @itinerary = Itinerary.find(params[:itinerary_id])
    @meal = Meal.new
  end

  def create
    itinerary = Itinerary.find(params[:itinerary_id])
    meal_params = params.require(:meal).permit(:title, :comment, :location,
      :activity_date, :cuisine, :price_rating)
    meal = Meal.new(meal_params)
    itinerary.activities << meal
    redirect_to trip_plan_itinerary_path(meal.itinerary.trip_plan.id, meal.itinerary.id)
  end
end
