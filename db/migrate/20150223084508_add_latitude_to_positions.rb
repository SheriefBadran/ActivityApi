class AddLatitudeToPositions < ActiveRecord::Migration
  def change
    add_column :positions, :latitude, :float
  end
end
