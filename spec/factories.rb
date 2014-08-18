FactoryGirl.define do
	factory :reader do
		email 's@yam.com'
		password 'pass'
		password_confirmation 'pass'
	end
end

FactoryGirl.define do
	factory :book do
		title 'The Hamlet'
	end
end