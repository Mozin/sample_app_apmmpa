class AddFakeNamesToUser < ActiveRecord::Migration
  def change
    add_column :users, :fake_name, :string
  end
end
