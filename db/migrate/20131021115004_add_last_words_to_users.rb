class AddLastWordsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :last_words, :boolean ,:default=> false
  end
end
