class HomeController < ApplicationController
  def index
    location = params[:location]
    start_date = params[:start_date]
    end_date = params[:end_date]

    @itineraries = Itinerary.where("((location like ?) and
      (start_date <= ? and end_date >= ?)) or
      ((location like ?) and (start_date <= ? and end_date >= ?))",
      location, start_date, start_date, location, end_date, end_date)
  end

end
