class Match < ApplicationRecord
  belongs_to :trip_plan
  enum status: %i[pendent accepted rejected]
end
