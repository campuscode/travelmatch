class Itinerary < ApplicationRecord
  belongs_to :trip_plan
  has_many :activities
  validates :location, presence: { message: 'Preencha a Localização' }
  validates :season, presence: { message: 'Preencha a Temporada' }
  validates :start_date, presence: { message: 'Preencha a Data Início' }
  validates :end_date, presence: { message: 'Preencha a Data Fim' }

  validate :verify_end_date, :verify_conflict

  private

  def verify_end_date
    return unless all_dates_present && start_date > end_date
    errors.add(:base, 'A data ínicio não pode ser maior que a data fim.')
  end

  def verify_conflict
    return unless all_dates_present && itinerary_dates_valid
    errors.add(:base, "A data do itinerário está fora do intervalo \
de data do seu plano de viagem")
  end

  def all_dates_present
    start_date && end_date && trip_plan
  end

  def itinerary_dates_valid
    trip_plan.start_date > start_date || trip_plan.end_date < end_date
  end
end
