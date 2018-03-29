class MatchesController < ApplicationController
  before_action :authenticate_user!

  def index
    @matches = current_user.matches
  end

  def create
    match_params = params.require(:match).permit(:comment)

    match = Match.new(match_params)
    match.user = current_user
    match.trip_plan = TripPlan.friendly.find(params[:trip_plan_id])
    return unless match.save!
    flash[:notice] = 'Sua solicitação foi enviada com sucesso!'
    redirect_to match.trip_plan
  end

  def accept
    match = Match.find(params[:match_id])
    match.accepted!
    redirect_to trip_plan_path(match.trip_plan)
  end
end
