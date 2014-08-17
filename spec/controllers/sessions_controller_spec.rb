require 'rails_helper'

describe SessionsController do

	
	describe 'GET new' do
		before { get :new}

		it {should render_template(:new)}
	end	

	# describe 'GET new' do
	# 	it 'should render new templage' do
	# 		get :new
	# 		expect(response).to render_template(:new)
	# 	end
	# end	

	describe 'GET destroy' do
		it 'sets session[:current_reader_id] to nil' do
			session[:current_reader_id] = 1
			get :destroy
			expect(session[:current_reader_id]).to be_nil
		end

		it 'redirects to homve page' do
			get :destroy
			expect(response).to redirect_to root_path
		end
	end	
end