class AddDescriptionToHouses < ActiveRecord::Migration[7.0]
  def change
    add_column :houses, :description, :string
  end
end
