class SearchController < ApplicationController
  def index
    start_date = Date.parse(params[:start_date])
    end_date = Date.parse(params[:end_date])
    if start_date > end_date
      flash[:error] = 'A data inicial não pode ser maior que a data final'
    else @itineraries = Itinerary.where(
      "(location like :location and ((start_date <= :start and
      end_date >= :start) or (start_date <= :end and end_date >= :end)))",
      location: params[:location], start: start_date, end: end_date
    )
    end
  end
end
