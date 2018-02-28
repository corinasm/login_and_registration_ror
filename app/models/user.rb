class User < ApplicationRecord
  	has_secure_password
  	EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
	validates :first_name, :last_name, :email, :location, :state, :password, :presence => true 
	validates :first_name, :last_name, :length =>  { :minimum => 2 } 
	validates :password, :length => { :minimum => 8 } 
	#validates :email, :format { with: EMAIL_REGEX }
	validates :email, :uniqueness => true

	before_save :downcase_email

	private
	def downcase_email
		self.email.downcase!
	end
end
