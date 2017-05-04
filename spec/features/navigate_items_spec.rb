require 'rails_helper'

describe "navigating between index and show page" do 

	it "should link to show page from index page" do 
		item = Item.create(name: "orange",
						   price: 1.49,
						   quantity: 6989)

		visit items_url
		click_link(item.name)
		expect(current_path).to eq(item_path(item))
	end

	it "should link to index page from show page" do 
		item = Item.create(name: "orange",
						   price: 1.49,
						   quantity: 6989)

		visit item_path(item)
		click_link("All Items")
		expect(current_path).to eq(items_path)
	end
end