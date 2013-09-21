class AddGameJoinStatusToUser < ActiveRecord::Migration
  def change
    add_column :users, :game_join_status, :boolean, :default=> false
  end
end
