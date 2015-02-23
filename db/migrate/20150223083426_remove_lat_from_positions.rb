class RemoveLatFromPositions < ActiveRecord::Migration
  def change
    remove_column :positions, :lat, :string
  end
end
