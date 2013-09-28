class AddModeStatusToUser < ActiveRecord::Migration
  def change
    add_column :users, :mode_status, :boolean,:default=> true
  end
end
