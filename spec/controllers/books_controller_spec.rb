require 'rails_helper'

describe BooksController do

	let(:reader){FactoryGirl.create(:reader)}

	before do
		controller.class.skip_before_action :auth
		#controller.stub(:auth).and_return(true)

	end

	describe 'GET new' do

		it 'should render new templage' do
			get :new

			expect(response).to render_template(:new)
		end

		it 'should assign @book variable to the view' do
			book = Book.new
			get :new

			expect(assigns[:book]).to be_a_new(Book)
		end
	end

	describe 'POST create' do
		it "should create a new book" do
			expect{
				post :create, { book: {title: 'The Hamlet'}}
			}.to change(Book, :count).by(1)
		end
	end

	describe 'Destroy' do
		book = Book.create(title: 'The Hamlet')
		it 'should delete book' do
			expect do
				delete :destroy, id: book.id
			end.to change(Book, :count).by(-1)
		end

		it 'should redirect to library page' do
			delete :destroy, id: book.id
			expect(response).to redirect_to root_path
		end
	end
end