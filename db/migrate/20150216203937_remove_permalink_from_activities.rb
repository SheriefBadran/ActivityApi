class RemovePermalinkFromActivities < ActiveRecord::Migration
  def change
    remove_column :activities, :permalink, :string
  end
end
