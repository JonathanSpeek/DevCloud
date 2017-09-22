class AddFolderId < ActiveRecord::Migration
  def change
    add_column :notes, :folder_id, :integer
    add_column :uploads, :folder_id, :integer
  end
end
