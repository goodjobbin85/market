class Farmer < ApplicationRecord
  belongs_to :item
  belongs_to :source
end
