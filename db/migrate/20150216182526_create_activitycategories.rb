class CreateActivitycategories < ActiveRecord::Migration
  def change
    create_table :activitycategories do |t|
      t.integer :activity_id
      t.integer :category_id

      t.timestamps null: false
    end
  end
end
