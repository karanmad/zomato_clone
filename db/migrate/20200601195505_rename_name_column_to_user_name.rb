class RenameNameColumnToUserName < ActiveRecord::Migration[6.0]
  def change
    rename_column :users, :name, :Username
  end
end
