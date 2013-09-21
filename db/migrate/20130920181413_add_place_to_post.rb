class AddPlaceToPost < ActiveRecord::Migration
  def change
    add_column :posts, :place, :string,:default => nil
  end
end
