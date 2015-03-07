class AddCityToPositions < ActiveRecord::Migration
  def change
    add_column :positions, :city, :string
  end
end
