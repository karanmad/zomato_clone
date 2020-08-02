class RemoveColumnsFromMenuUploads < ActiveRecord::Migration[6.0]
  def change
    remove_column :menu_uploads, :created_at, :datetime
    remove_column :menu_uploads, :updated_at, :datetime
  end
end
