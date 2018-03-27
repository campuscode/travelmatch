class Itinerary < ApplicationRecord
  belongs_to :trip_plan
  validates :location, presence: { message: 'Preencha a Localização' }
  validates :season, presence: { message: 'Preencha a Temporada' }
  validates :start_date, presence: { message: 'Preencha a Data Início' }
  validates :end_date, presence: { message: 'Preencha a Data Fim' }

  validate :verify_end_date, :verify_conflict

  private
  def verify_end_date
    if start_date && end_date && trip_plan
      if start_date > end_date
        errors.add(:base, "A data ínicio não pode ser maior que a data fim.")
      end
    end
  end

  def verify_conflict
    if start_date && end_date && trip_plan
      if trip_plan.start_date >= start_date || trip_plan.end_date <= end_date
         errors.add(:base, 'A data do itinerario está fora do intervalo de data do seu plano de viagem')
      end
    end
  end
end
