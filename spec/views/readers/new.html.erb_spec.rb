require 'rails_helper'

describe 'readers/new.html.erb' do
	
	before :each do
		reader = mock_model('Reader').as_new_record.as_null_object
		assign(:reader, reader)
		render
	end

	it 'should have new_reader form' do		
		expect(rendered).to have_selector('form#new_reader')
	end

	it 'should have email form' do		
		expect(rendered).to have_selector('#reader_email')
	end

	it 'should have reader_password field' do
		expect(rendered).to have_selector('#reader_password')
	end

	it 'should have reader_password_confirmation field' do
		expect(rendered).to have_selector('#reader_password_confirmation')
	end

	it 'should have register button' do
		expect(rendered).to have_selector("input[type='submit']")
	end
end