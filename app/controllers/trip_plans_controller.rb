class TripPlansController < ApplicationController
  def index
    @trip_plans = TripPlan.all
  end

  def new
    @trip_plan = TripPlan.new
  end

  def create
    trip_params = params.require(:trip_plan).permit(:title, :start_date,
                                                    :end_date)
    @trip_plan = TripPlan.create(trip_params)

    if @trip_plan.save
      redirect_to trip_plans_path
    else
      flash[:error] = 'Não foi possível criar seu plano.'
      render :new
    end
  end
end
