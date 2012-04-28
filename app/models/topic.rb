class Topic < ActiveRecord::Base
  attr_accessible :title, :forum_id, :user_id
  belongs_to :forum  
  belongs_to :user
  
  has_many :posts, :dependent => :destroy
end
