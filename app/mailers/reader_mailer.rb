class ReaderMailer < ActionMailer::Base
	default from: 'test@test.com'

	def welcome(email)
		mail(to: email, subject: 'Libapp registration')
	end
end