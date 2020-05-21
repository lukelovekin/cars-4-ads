class AddCarOwnerToPost < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :car_owner, :boolean
  end
end
