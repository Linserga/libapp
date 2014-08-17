Given(/^I am a guest$/) do
  # express the regexp above with the code you wish you had
end

When(/^I fill the register form with valid data$/) do
	visit('/register')
	fill_in 'reader_email', with: 'reader01@mail.com'
	fill_in 'reader_password', with: 'pass'
	fill_in 'reader_password_confirmation', with: 'pass'
	click_button 'Register'
end

Then (/^I should be registered in application$/) do
	expect(Reader.find_by_email('reader01@mail.com')).not_to be_nil
end

Then(/^I should be logged in$/) do
	expect(page).to have_content("Welcome")
end

When(/^I fill the register form with invalid data$/) do
	visit new_reader_path
	fill_in 'reader_email', with: 'reader'
	fill_in 'reader_password', with: 'pass'
	fill_in 'reader_password_confirmation', with: 'pass'
	click_button 'Register'
end

Then(/^I should see the register form again$/) do
	expect(page).to have_selector('form#new_reader')
end

Then(/^I should not be registered in application$/) do
	expect(Reader.find_by_email('reader')).to be_nil
end


When(/^I go to home page$/) do
	visit root_path
end

Then(/^I should see guest menu$/) do
	expect(page).to have_selector('#top-menu')
	expect(page).to have_link('Register', href: register_path)
end

Given(/^I am a 'john@reader\.com' reader$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^I should see 'john@reader\.com' reader menu$/) do
  pending # express the regexp above with the code you wish you had
end


Given(/^reader with 'bob@reader\.com' exists$/) do
	Reader.create(email: 'bob@reader.com', password: 'pass', password_confirmation: 'pass')
end

When(/^I fill the login form with valid data for 'bob@reader\.com' reader$/) do
	visit login_path
	fill_in 'Email', with: 'bob@reader.com'
	fill_in 'Password', with: 'pass'
	click_button 'Log in'
end

Then(/^I should be logged in as 'bob@reader\.com' reader$/) do
	expect(page).to have_content("Welcome, bob@reader.com")
end

