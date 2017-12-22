# frozen_string_literal: true
# FoldersHelper
module FoldersHelper
  def find_parents(folder)
    @parent_folders ||= {}
    if folder.parent_folder_id.present?
      parent_folder = Folder.find(folder.parent_folder_id)
      @parent_folders[parent_folder.id.to_s] = parent_folder.name
      find_parents(parent_folder)
    end
    @parent_folders
  end
end
