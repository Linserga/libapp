require 'rails_helper'

describe ReadersController do
	
	let(:valid_attributes){
		{email:'s@m.com', password: 'pass', password_confirmation: 'pass'}
	}

	let(:invalid_attributes){
		{email:'reader', password: 'pass', password_confirmation: 'pass'}
	}

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
			expect{
				post :create, { reader: valid_attributes}
			}.to change(Reader, :count).by(1)
		end

		it 'should assign a newly created reader to @reader' do
			post :create, {reader: valid_attributes}

			expect(assigns(:reader)).to be_a(Reader)
			expect(assigns(:reader)).to be_persisted
		end

		it 'should render new form with error message with invalid parameters' do
			post :create, { reader: invalid_attributes}

			expect(response).to render_template(:new)
		end			
	end
end