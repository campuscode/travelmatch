class CreateMatches < ActiveRecord::Migration[5.1]
  def change
    create_table :matches do |t|
      t.text :comment
      t.integer :status, default: 0

      t.timestamps
    end
  end
end
