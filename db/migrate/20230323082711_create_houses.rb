class CreateHouses < ActiveRecord::Migration[7.0]
  def change
    create_table :houses do |t|
      t.string :name
      t.string :location
      t.float :price
      t.integer :bedrooms
      t.float :size_in_sqft
      t.belongs_to :seller, null: false, foreign_key: true

      t.timestamps
    end
  end
end
