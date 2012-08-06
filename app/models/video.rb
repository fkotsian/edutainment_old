class Video < ActiveRecord::Base
  attr_accessible :title, :vid_url, :description, :views
  belongs_to :user
  #has_many followers // or followed_by [list of followers?]
  
  validates :title, presence: true, length: { maximum: 60 }
  validates :vid_url, presence: true, length: { maximum: 200 }
  validates :description, presence: true, length: { maximum: 500 }
  validates :user_id, presence: true
  
  default_scope order: 'videos.created_at DESC'
end