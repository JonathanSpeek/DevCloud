class AddSizeToUploads < ActiveRecord::Migration
  def change
    add_column :uploads, :size, :string
  end
end
