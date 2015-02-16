class RemoveLongFromCategories < ActiveRecord::Migration
  def change
    remove_column :categories, :long, :string
  end
end
