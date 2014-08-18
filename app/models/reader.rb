class Reader < ActiveRecord::Base
	has_secure_password
	has_many :books
	before_save { self.email = email.downcase }
	validates :email, presence: true, 
				format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i },
				uniqueness: true

	validates :password, presence: true
	validates :password_confirmation, presence: true
end