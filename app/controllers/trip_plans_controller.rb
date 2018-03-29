class TripPlansController < ApplicationController
  def index
    @trip_plans = TripPlan.all
  end

  def show
    @trip_plan = TripPlan.find(params[:id]).decorate
    if @trip_plan.owner?(current_user)
      @matches = @trip_plan.matches
    else
      @match = @trip_plan.matches.where(user: current_user)
      return @match = Match.new if @match.empty?
    end
  end

  def new
    @trip_plan = TripPlan.new
  end

  def create
    @trip_plan = TripPlan.new(trip_params)
    @trip_plan.user = current_user
    if @trip_plan.save
      flash[:notice] = 'Parabéns! Você criou seu plano de viagem,
                        agora adicione um roteiro'
      redirect_to trip_plans_path
    else
      flash.now[:error] = 'Não foi possível criar seu plano.'
      render :new
    end
  end

  def my_plans
    @trip_plans = current_user.trip_plans
  end

  private

  def trip_params
    params.require(:trip_plan).permit(:title, :start_date, :end_date, :photo)
  end
end
