class TripPlanDecorator < ApplicationDecorator
  delegate_all

  def add_itinerary_link
    return '' unless user_is_owner
    h.link_to 'Adiciona Roteiro', new_trip_plan_itinerary_path(object)
  end

  def pendent_matches
    return '' unless user_is_owner
    matches = object.matches.pendent
    h.render partial: 'matches/pendent_matches', locals: { matches: matches }
  end

  def accepted_matches
    return '' unless user_is_owner
    matches = object.matches.accepted
    h.render partial: 'matches/accepted_matches', locals: { matches: matches }
  end

  private

  def user_is_owner
    object.owner?(h.current_user)
  end
end
