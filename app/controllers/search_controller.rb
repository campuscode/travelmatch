class SearchController < ApplicationController
  def index
    if start_date > end_date
      flash[:error] = 'A data inicial não pode ser maior que a data final'
    else @itineraries = Itinerary.where(
      "(location like :location and ((start_date <= :start and
      end_date >= :start) or (start_date <= :end and end_date >= :end)))",
      location: params[:location], start: start_date, end: end_date
    )
    end
  end

  private

  def start_date
    if params[:start_date].empty?
      Time.zone.today
    else
      Date.parse(params[:start_date])
    end
  end

  def end_date
    if params[:end_date].empty?
      10.months.from_now
    else
      Date.parse(params[:end_date])
    end
  end
end
