module ApplicationHelper

	# Returns the appropriate title (full or base) on a per-page basis
	def full_title(page_title)
		base_title = "EduTainment"
		if page_title.empty?
			"Welcome to #{base_title}!"
		else 
			"#{base_title} | #{page_title}"
		end
	end
end
