require 'rails_helper'

describe Reader do
	
	before do
		@reader = Reader.new(email: 's@y.com', password: 'pass', password_confirmation: 'pass')
	end

	subject { @reader }

	it {should validate_presence_of :email}
	it {should validate_uniqueness_of(:email)}
	it {should validate_presence_of :password}
	it {should validate_presence_of :password_confirmation}

	it 'should be an ActiveRecord model' do
		expect(Reader.superclass).to eq(ActiveRecord::Base)
	end

	it { should respond_to(:email)}

	describe 'email is empty' do
		before { @reader.email = ''}
		it {should_not be_valid}
	end

	# describe 'when email address is already taken' do
	# 	before do
	# 		reader_with_same_email = @reader.dup
	# 		reader_with_same_email.email = @reader.email.upcase
	# 		reader_with_same_email.save
	# 	end
	# 	it {should_not be_valid}
	# end
end