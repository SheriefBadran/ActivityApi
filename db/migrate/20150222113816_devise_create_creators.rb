class DeviseCreateCreators < ActiveRecord::Migration
  def change
    create_table(:creators) do |t|
      t.string :email
      t.string :password_digest

      t.timestamps
    end

    add_index :creators, :email, unique: true
  end
end
