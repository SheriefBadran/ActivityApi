class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :lat
      t.string :long

      t.timestamps null: false
    end
  end
end
