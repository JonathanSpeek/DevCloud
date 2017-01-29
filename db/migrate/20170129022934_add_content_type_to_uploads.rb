class AddContentTypeToUploads < ActiveRecord::Migration
  def change
    add_column :uploads, :content_type, :string
  end
end
