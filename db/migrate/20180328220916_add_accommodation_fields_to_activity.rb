class AddAccommodationFieldsToActivity < ActiveRecord::Migration[5.1]
  def change
    add_column :activities, :daily_value, :decimal
    add_column :activities, :accommodation_type, :string
  end
end
