module ApplicationHelper

	def page_title
		if content_for?(:title)
			"Market - #{content_for(:title)}"
		else
			"Market"
		end
	end
	
end
