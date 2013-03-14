class Video < ActiveRecord::Base
  attr_accessible :title, :vid_url, :description, :views
  belongs_to :user
  #has_many followers // or followed_by [list of followers?]
  
  before_save do |video| 
		if video.vid_url.include? "you" 
			watch_regex = /watch['?]v=/
			strip_regex = /&.*/
			video.vid_url = vid_url.sub(watch_regex, "embed/").sub(strip_regex, "")	
		elsif video.vid_url.include? "vimeo"
			vid_id = vid_url.slice(/\d+/i)
			video.vid_url = "http://player.vimeo.com/video/".concat(vid_id)
		end
  end
  
  validates :title, presence: true, length: { maximum: 60 }
  validates :vid_url, presence: true, length: { maximum: 200 }
  validates :description, presence: true, length: { maximum: 500 }
  validates :user_id, presence: true
  
  default_scope order: 'videos.created_at DESC'
  
	private
		# def filter_urls	#written as before_save above
			# watch_regex = /watch?v=\//
			# self.vid_url.gsub(watch_regex  
end