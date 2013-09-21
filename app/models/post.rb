class Post < ActiveRecord::Base
  attr_accessible :content,:place
  belongs_to :user
  
  validates :user_id,:presence=> true
  validates :content,:presence=>true
  validates :place,:presence=>true

end
