require 'rails_helper'

describe "creating a new item" do 

	before do 
		admin = User.create!(user_attributes(admin: true))
		sign_in(admin)

		@source1 = Source.create!(name: "oberweiss")
		@source2 = Source.create!(name: "Greenleaf")
		@source3 = Source.create!(name: "whitman")
	end
	
	it "should create new item and redirect to new item show page" do 

		visit items_url
		click_link "Add New Item"
		expect(current_path).to eq(new_item_path)

		fill_in "Name", with: "tomato"
		fill_in "Quantity", with: "500"
		fill_in "Price", with: "1.49"
		fill_in "Description", with: "wowwwwwwwwwwwwwwwwwww"

		check(@source1.name)
		check(@source2.name)
		

		click_button "Create Item"
		expect(current_path).to eq(item_path(Item.last))
		expect(page).to have_text("1.49")
		expect(page).to have_text("Item Successfully Created!")
		expect(page).to have_text(@source1.name)
		expect(page).to have_text(@source2.name)
		expect(page).not_to have_text(@source3.name)
	end
end