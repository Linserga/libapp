require 'rails_helper'

describe ReadersController do
	describe 'GET new' do
		
		it 'assigns @reader variable to the view' do
			reader = Reader.new
			get :new

			expect(assigns[:reader]).to be_a_new(Reader)
		end

		it 'renders new template' do
			get :new
			expect(response).to render_template :new
		end
	end

	describe 'Post create' do
		it 'should save new reader with valid parameters' do
			reader = Reader.create!(email: 's@m.com', password: 'pass', password_confirmation: 'pass')
			
			expect(reader.reload.email).to eq('s@m.com')
			expect(response).to have_http_status(200)
			expect(flash).not_to be_nil
		end		
	end
end