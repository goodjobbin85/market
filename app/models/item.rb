class Item < ApplicationRecord
	validates :name, presence: true, uniqueness: true
	validates :price, presence: true, numericality: true
	validates :quantity, presence: true, numericality: { only_integer: true }
	validates :description, presence: true

	
end
