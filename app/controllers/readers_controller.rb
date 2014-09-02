class ReadersController < ApplicationController

	def new
		@reader = Reader.new
	end

	def create
		@reader = Reader.new(reader_params)

		if @reader.save
			ReaderMailer.welcome(@reader.email)
			flash[:success] = "Welcome, #{@reader.email}"
			login @reader
			redirect_to root_path
		else
			flash.now[:error] = 'There occured a problem. Try again'
			render :new
		end
	end

	private 
		def reader_params
			params.require(:reader).permit(:email, :password, :password_confirmation)
		end
end