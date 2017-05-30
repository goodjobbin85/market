require 'rails_helper'

describe "deleting an item" do 

	before do 
		admin = User.create!(user_attributes(admin: true))
		sign_in(admin)
	end

	it "should remove item and redirect to index page" do 
		item = Item.create(item_attributes)
		visit item_path(item)
		click_link 'Delete Item'
		expect(current_path).to eq(items_path)
		expect(page).not_to have_text(item.name)
		expect(page).to have_text("Item Successfully Deleted!")
	end
end