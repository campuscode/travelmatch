class TripPlan < ApplicationRecord
  has_attached_file :photo, styles: { medium: '300x300>', thumb: '100x100>' },
                            default_url: '/images/:style/default.png'
  validates_attachment_content_type :photo, content_type: %r{\Aimage\/.*\z}
  # belongs_to :owner, class_name: 'User'
  belongs_to :user
  has_many :itineraries, dependent: :destroy
  has_many :matches, dependent: :destroy
  has_many :users, through: :matches
  validates :title, :start_date, :end_date, presence: true
  validate :end_date_smaller_than_start_date

  def end_date_smaller_than_start_date
    return unless start_date && end_date && end_date < start_date
    errors.add(:end_date, "can't be smaller than start date")
  end

  def owner?(user)
    self.user == user
  end
end
