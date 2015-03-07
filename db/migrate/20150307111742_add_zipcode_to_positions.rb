class AddZipcodeToPositions < ActiveRecord::Migration
  def change
    add_column :positions, :zipcode, :string
  end
end
