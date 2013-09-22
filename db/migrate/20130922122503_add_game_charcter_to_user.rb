class AddGameCharcterToUser < ActiveRecord::Migration
  def change
    add_column :users, :game_character, :string
  end
end
