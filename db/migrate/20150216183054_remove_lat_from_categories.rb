class RemoveLatFromCategories < ActiveRecord::Migration
  def change
    remove_column :categories, :lat, :string
  end
end
