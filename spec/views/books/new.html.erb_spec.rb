require 'rails_helper'

describe 'new book' do

	let(:book){FactoryGirl.create(:book)}
	let(:reader){FactoryGirl.create(:reader)}

	subject{page}	

	before do
		visit login_path
		fill_in 'Email', with: reader.email
		fill_in 'Password', with: reader.password
		click_button 'Log in'
		visit new_book_path
	end

	describe 'with valid title' do
		before do	
			fill_in 'Title', with: 'The Hamlet'
			click_button 'Create'
		end

		it {should have_content('The Hamlet')}
		it {should have_link('Delete')}
		it {should have_link('Edit')}
	end

	describe 'with invalid title' do

		before do
			book.title = ''
			click_button 'Create'
		end

		it{should have_selector('div.alert.alert-error')}
		it{should have_content('Error')}
	end
end