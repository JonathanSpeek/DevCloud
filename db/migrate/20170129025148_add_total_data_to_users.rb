class AddTotalDataToUsers < ActiveRecord::Migration
  def change
    add_column :users, :total_data, :integer
  end
end
