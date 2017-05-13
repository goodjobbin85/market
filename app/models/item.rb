class Item < ApplicationRecord
	validates :name, presence: true, uniqueness: true
	validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }
	validates :quantity, presence: true, numericality: { only_integer: true, 
												greater_than_or_equal_to: 0 }
	validates :description, presence: true, length: { minimum: 21 }

	scope :in_season, -> { where(in_season: true) }
end
