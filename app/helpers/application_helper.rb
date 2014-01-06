module ApplicationHelper

	def error_messages_for(object)
		render(:partial => 'application/error_messages', :locals => {:object => object})
	end

	def title(page_title)
  	content_for :title, page_title.to_s
	end

	private

		def determine_layout
			session[:user_id] ? "application" : "not_logged_in"
		end
	
end
