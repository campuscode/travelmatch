class AddFieldsToActivity < ActiveRecord::Migration[5.1]
  def change
    add_column :activities, :cuisine, :string
    add_column :activities, :price_rating, :string
  end
end
