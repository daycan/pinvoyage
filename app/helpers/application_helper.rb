module ApplicationHelper

	def error_messages_for(object)
		render(:partial => 'application/error_messages', :locals => {:object => object})
	end

	def title(page_title)
  	content_for :title, page_title.to_s
	end

	def is_active(action)       
    params[:action] == action ? "active" : nil        
  end


	
end
