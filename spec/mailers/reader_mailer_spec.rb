require 'rails_helper'

describe ReaderMailer do

	describe '#welcome' do
		let(:email){ReaderMailer.welcome('email@email.com')}
		it 'should be delivered to provided email' do
			expect(email).to deliver_to('email@email.com')
		end

		it 'should have welcome message in the body' do
			expect(email).to have_body_text('Welcome to Libapp')
		end

		it 'should have subject' do
			expect(email).to have_subject('Libapp registration')
		end
	end

end