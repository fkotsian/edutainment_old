class Video < ActiveRecord::Base
  attr_accessible :title, :url, :user_id, :views
  belongs_to :user
  #has_many followers // or followed_by [list of followers?]
  
  validates :url, presence: true, length: { maximum: 200 }
  validates :user_id, presence: true
  
  default_scope order: 'videos.created_at DESC'
end