class User < ApplicationRecord

	validates :first_name, :last_name, :address, :phone, :email, presence: true
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\w]+\.[a-z\d]+\z/
	validates  :email, format: { with: VALID_EMAIL_REGEX },
			   uniqueness: { case_sensitive: false }
	has_secure_password
end