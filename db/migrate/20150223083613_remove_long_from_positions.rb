class RemoveLongFromPositions < ActiveRecord::Migration
  def change
    remove_column :positions, :long, :string
  end
end
