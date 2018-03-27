class Match < ApplicationRecord
  belongs_to :trip_plan
  enum status: [ :pendent, :accepted, :rejected ]
end
