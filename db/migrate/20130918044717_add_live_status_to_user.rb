class AddLiveStatusToUser < ActiveRecord::Migration
  def change
    add_column :users, :live_status, :boolean, :default=> true
  end
end
