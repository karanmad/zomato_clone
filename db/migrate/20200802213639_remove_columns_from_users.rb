class RemoveColumnsFromUsers < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :created_at, :datetime
    remove_column :users, :updated_at, :datetime
  end
end
