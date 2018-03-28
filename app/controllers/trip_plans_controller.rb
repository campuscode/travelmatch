class TripPlansController < ApplicationController
  def index
    @trip_plans = TripPlan.all
  end

  def show
    @trip_plan = TripPlan.find(params[:id])
    @match = @trip_plan.matches.last # .where('user = ?',current_user)
    return @match_new = Match.new if @match.nil?
  end

  def new
    @trip_plan = TripPlan.new
  end

  def create
    @trip_plan = TripPlan.create(trip_params)

    if @trip_plan.save
      flash[:success] = 'Parabéns! Você criou seu plano de viagens,
                        agora adicione um roteiro'
      redirect_to trip_plans_path
    else
      flash[:error] = 'Não foi possível criar seu plano.'
      render :new
    end
  end

  private

  def trip_params
    params.require(:trip_plan).permit(:title, :start_date, :end_date)
  end
end
