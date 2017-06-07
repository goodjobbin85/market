class Source < ApplicationRecord
	validates :name, presence: true, uniqueness: true
	has_many :farmers, dependent: :destroy
	has_many :items, through: :farmers
end
