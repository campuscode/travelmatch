class MatchesController < ApplicationController
  def create
    match_params = params.require(:match).permit(:comment)

    match = Match.new(match_params)
    match.trip_plan = TripPlan.find(params[:trip_plan_id])
    return unless match.save
    flash[:notice] = 'Sua solicitação foi enviada com sucesso!'
    redirect_to match.trip_plan
  end
end
