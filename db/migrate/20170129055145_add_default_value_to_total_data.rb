class AddDefaultValueToTotalData < ActiveRecord::Migration
  def change
    change_column :users, :total_data, :integer, :default => 0
  end
end
