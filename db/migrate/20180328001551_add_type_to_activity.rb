class AddTypeToActivity < ActiveRecord::Migration[5.1]
  def change
    add_column :activities, :type, :string
    add_column :activities, :spot_type, :string
    add_column :activities, :value, :decimal
  end
end
