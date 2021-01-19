class RenameUser < ActiveRecord::Migration[6.1]
  def change
    rename_column :users, :username, :personal_data
  end
end
