class HomeController < ApplicationController
  def index
    location = params[:location]
    start_date = params[:start_date]
    end_date = params[:end_date]

    start_date = Date.parse(params[:start_date]) if start_date.present?
    end_date = Date.parse(params[:end_date]) if end_date.present?

    # if start_date > end_date
      # flash[:errors] = 'A data inicial não pode ser maior que a data final'
    # else
      @itineraries = Itinerary.where("
        (location like :location and ((start_date <= :start and end_date >= :start)
        or (start_date <= :end and end_date >= :end)))",
        { location: location, start: start_date, end: end_date})
    # end
  end
end
