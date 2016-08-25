class AddDeletedAtToUploads < ActiveRecord::Migration
  def change
    add_column :uploads, :deleted_at, :datetime
    add_index :uploads, :deleted_at
  end
end
