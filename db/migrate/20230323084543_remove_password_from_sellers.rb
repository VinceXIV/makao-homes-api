class RemovePasswordFromSellers < ActiveRecord::Migration[7.0]
  def change
    remove_column :sellers, :password
  end
end
