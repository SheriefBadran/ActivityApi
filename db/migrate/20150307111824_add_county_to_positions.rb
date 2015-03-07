class AddCountyToPositions < ActiveRecord::Migration
  def change
    add_column :positions, :country, :string
  end
end
