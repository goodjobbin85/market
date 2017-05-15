require 'rails_helper'

describe "creating a new item" do 

	it "should create new item and redirect to new item show page" do 
		visit items_url
		click_link "Add New Item"
		expect(current_path).to eq(new_item_path)

		fill_in "Name", with: "tomato"
		fill_in "Quantity", with: "500"
		fill_in "Price", with: "1.49"
		fill_in "Description", with: "wowwwwwwwwwwwwwwwwwww"
		

		click_button "Create Item"
		expect(current_path).to eq(item_path(Item.last))
		expect(page).to have_text("1.49")
		expect(page).to have_text("Item Successfully Created!")
	end
end