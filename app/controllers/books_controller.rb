class BooksController < ApplicationController

	before_action :auth

	def	new
		@book = Book.new
	end

	def create
		@book = Book.new(book_params)
		@book.reader_id = session[:current_reader_id]
		if @book.save
			flash[:success] = 'Book was successfully created'
			redirect_to book_path(@book)
		else
			flash.now[:error] = 'Error'
			render :new
		end		
	end

	def show	
		begin
			@book = Book.find(params[:id])
		rescue ActiveRecord::RecordNotFound
			flash[:error] = "Book doesn't exists"
			redirect_to root_path
		end
	end

	def edit
		begin
			@book = current_reader.books.find(params[:id])
		rescue ActiveRecord::RecordNotFound
			flash[:error] = 'This book belongs to another user'
			redirect_to root_path
		end
	end 

	def update
		@book = Book.find(params[:id])

		if @book.update(book_params)
			flash[:success] = 'The book was successfully updated'
			redirect_to @book
		else
			flash.now[:error] = 'Error'
			render :edit
		end

	end

	def destroy
		Book.find(params[:id]).destroy
		flash[:success] = 'Book was successfully deleted'
		redirect_to root_path
	end

	private

		def book_params
			params.require(:book).permit(:title)
		end
end