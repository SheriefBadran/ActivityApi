class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.string :name
      t.string :description
      t.boolean :indoors
      t.integer :position_id

      t.timestamps null: false
    end
  end
end
