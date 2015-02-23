class AddLongitudeToPositions < ActiveRecord::Migration
  def change
    add_column :positions, :longitude, :float
  end
end
