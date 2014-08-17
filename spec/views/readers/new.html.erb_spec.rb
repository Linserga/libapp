require 'rails_helper'

describe 'readers/new.html.erb' do
	
	subject {page}
	describe 'with invalid information' do
		before { visit new_reader_path}

		it { should have_selector('form#new_reader')}
		it { should have_selector('#reader_email')}
		it { should have_selector('#reader_password')}
		it { should have_selector('#reader_password_confirmation')}
		it { should have_selector("input[type='submit']")}	
	end

	describe 'with invalid information' do
		before { visit new_reader_path}
		it 'should not create a reader' do
			expect { click_button 'Register'}.not_to change(Reader, :count)
		end
	end
	describe 'with valid info' do
		before do
			visit new_reader_path
			fill_in 'Email', with: 's@y.com'
			fill_in 'Password', with: 'pass'
			fill_in 'Confirm', with: 'pass'
		end

		it 'should create a user' do
			expect {click_button 'Register'}.to change(Reader, :count).by(1)
		end

		describe 'after submission' do
			before { click_button 'Register'}

			let(:reader) {Reader.find_by(email: 's@y.com')}
			
			it {should have_link('Log out')}
			it {should have_selector('div.alert.alert-success')}
		end
	end
end