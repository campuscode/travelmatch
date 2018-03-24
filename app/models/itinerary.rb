class Itinerary < ApplicationRecord
  belongs_to :trip_plan
  validates :location, presence: { message: 'Preencha a Localização' }
  validates :season, presence: { message: 'Preencha a Temporada' }
  validates :start_date, presence: { message: 'Preencha a Data Início' }
  validates :end_date, presence: { message: 'Preencha a Data Fim' }
end
