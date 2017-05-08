require 'rails_helper'

describe "visiting item show page" do 

	it "should display item info" do 
		item = Item.create(item_attributes)

		visit item_path(item)

		expect(page).to have_text(item.name.upcase)
		expect(page).to have_text(item.price)
		expect(page).to have_text(item.quantity)
	end
end