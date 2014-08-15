class Reader < ActiveRecord::Base
	before_save { self.email = email.downcase }
	attr_accessor :password, :password_confirmation
	validates :email, presence: true, 
				format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i },
				uniqueness: true

	validates :password, presence: true
	validates :password_confirmation, presence: true
end