require 'rails_helper'

describe 'readers/new.html.erb' do
	
	subject {page}
	before { visit new_reader_path}

	it { should have_selector('form#new_reader')}
	it { should have_selector('#reader_email')}
	it { should have_selector('#reader_password')}
	it { should have_selector('#reader_password_confirmation')}
	it { should have_selector("input[type='submit']")}
	
	describe 'with invalid information' do
		it 'should not create a reader' do
			expect { click_on 'Register'}.not_to change(Reader, :count)
		end
	end

	describe 'after submission' do
		before { click_on 'Register'}

		it {should have_content('There occured a problem. Try again')}
	end

	describe 'with valid info' do
		before do
			fill_in 'Email', with: 's@y.com'
			fill_in 'Password', with: 'pass'
			fill_in 'Confirm', with: 'pass'
		end

		it 'should create a user' do
			expect {click_on 'Register'}.to change(Reader, :count).by(1)
		end
	end
end