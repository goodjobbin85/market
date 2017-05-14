class User < ApplicationRecord
	validates :first_name, :last_name, :address, :phone, :email, presence: true
	validates :email, uniqueness: true, format: { with: /\A[\w+\-.]+@[a-z\w]+\.[a-z\d]+\z/ }

end