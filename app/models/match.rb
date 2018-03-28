class Match < ApplicationRecord
  belongs_to :trip_plan
  belongs_to :user
  enum status: %i[pendent accepted rejected]

  # def trip_owner
  #    trip_plan.user
  # end
end
