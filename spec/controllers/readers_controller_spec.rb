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
end