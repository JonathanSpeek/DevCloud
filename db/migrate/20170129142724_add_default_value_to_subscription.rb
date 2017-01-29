class AddDefaultValueToSubscription < ActiveRecord::Migration
  def change
    change_column :users, :subscription, :string, :default => "free"
  end
end
