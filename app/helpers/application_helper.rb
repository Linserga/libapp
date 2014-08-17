module ApplicationHelper

	def logged_in?
		!current_reader.nil?
	end

  	def current_reader
  		@_current_reader ||= session[:current_reader_id] && Reader.find_by(id: session[:current_reader_id])
  	end	

  	def auth
		if !logged_in?
			flash[:error] = 'Please log in'
			redirect_to login_path
		end			
	end	
end
