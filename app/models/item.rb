class Item < ApplicationRecord

	has_many :reviews, dependent: :destroy
	has_many :favorites, dependent: :destroy
	has_many :fans, through: :favorites, source: :user
	has_many :farmers, dependent: :destroy
	has_many :sources, through: :farmers

	validates :name, presence: true, uniqueness: true
	validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }
	validates :quantity, presence: true, numericality: { only_integer: true, 
												greater_than_or_equal_to: 0 }
	validates :description, presence: true, length: { minimum: 21 }

	scope :in_season, -> { where(in_season: true) }
end
