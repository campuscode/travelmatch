class ItinerariesController < ApplicationController
  def new
    @trip_plan = TripPlan.find(params[:trip_plan_id])
    @itinerary = Itinerary.new
  end

  def create
    @trip_plan = TripPlan.find(params[:trip_plan_id])
    @itinerary = @trip_plan.itineraries.build(itinerary_params)
    if  @itinerary.save
      flash[:notice] = 'Roteiro cadastrado com sucesso.'
      redirect_to trip_plan_itinerary_path(@trip_plan, @itinerary)
    else
      flash[:notice] = "Você precisa preencher todos os campos."
      render :new
    end
  end

  private
  def itinerary_params
    params.require(:itinerary).permit(:location, :season, :start_date, :end_date)
  end
end
