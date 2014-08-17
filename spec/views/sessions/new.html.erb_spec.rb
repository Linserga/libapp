require 'rails_helper'

describe 'sessions/new.html.erb' do
	
	let(:reader){FactoryGirl.create(:reader)}

	subject {page}
	
	describe 'with valid info' do
		before do
			visit login_path			

			fill_in 'Email', with: reader.email.upcase
			fill_in 'Password', with: reader.password
			click_button 'Log in'
		end		
	
		it {should have_selector("div.alert.alert-success")}
		it {should have_content('You are logged in')}
		it {should have_link('Log out'), href: logout_path}

		describe 'multiple submission' do
			before do
				visit login_path
			end
			it {should have_content('You are already logged in')}		
		end
	end

	describe 'with invalid info' do
		before do
			visit login_path
			click_button 'Log in'
		end
			it {should have_selector("div.alert.alert-error")}
			it {should have_content('Invalid email/password combination')}

		describe "after visiting another page" do
        	before { visit root_path }
        	it { should_not have_selector("div.alert.alert-error") }
      end
	end	
end