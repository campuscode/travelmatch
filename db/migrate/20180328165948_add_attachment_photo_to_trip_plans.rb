class AddAttachmentPhotoToTripPlans < ActiveRecord::Migration[5.1]
  def self.up
    change_table :trip_plans do |t|
      t.attachment :photo
    end
  end

  def self.down
    remove_attachment :trip_plans, :photo
  end
end
