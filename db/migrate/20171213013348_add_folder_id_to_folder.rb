class AddFolderIdToFolder < ActiveRecord::Migration
  def change
    add_column :folders, :parent_folder_id, :integer
  end
end
