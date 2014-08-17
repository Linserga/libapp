class SessionsController < ApplicationController

	before_action :already_logged_in ,only: [:new] 

	def new
		
	end

	def create
		reader = Reader.find_by(email: params[:session][:email].downcase)
		if reader && reader.authenticate(params[:session][:password])
			session[:current_reader_id] = reader.id
			flash[:success] = "You are logged in. Welcome, #{reader.email}"
			redirect_to root_path
		else
			flash.now[:error] = 'Invalid email/password combination'
			render :new
		end		
	end

	def destroy
		@_current_reader = session[:current_reader_id] = nil
		flash[:success] = 'You have been successfully logged out'
		redirect_to root_url
	end

	private
		def already_logged_in
			if logged_in?
				flash[:error] = 'You are already logged in'
				redirect_to root_path
			end
		end		
end