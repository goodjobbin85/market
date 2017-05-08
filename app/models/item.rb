class Item < ApplicationRecord
	validates :name, presence: true, uniqueness: true
	validates :price, presence: true, numericality: true
	validates :quantity, presence: true, numericality: { only_integer: true }
	validates :description, presence: true

	scope :in_season, -> { where(in_season: true) }
end
