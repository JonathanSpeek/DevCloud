class CreateFolders < ActiveRecord::Migration
  def change
    create_table :folders do |t|
      t.string :name
      t.integer  "user_id"
      t.integer  "note_id"
      t.integer  "upload_id"
      t.string   "size"

      t.timestamps null: false
    end
  end
end
