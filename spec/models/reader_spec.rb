require 'rails_helper'

describe Reader do
	
	let(:reader){Reader.new}

	it 'should be an ActiveRecord model' do
		expect(Reader.superclass).to eq(ActiveRecord::Base)
	end

	it 'should have email' do
		reader.email = 'email@email.com'

		expect(reader.email).to eq('email@email.com')
	end
	it 'should respond to password' do
		reader.password = 'pass'

		expect(reader.password).to eq('pass')
	end
	it 'should respong to password_confirmation' do
		reader.password_confirmation = 'pass'

		expect(reader.password_confirmation).to eq('pass')
	end
end