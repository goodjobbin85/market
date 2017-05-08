require 'rails_helper'

describe "deleting an item" do 

	it "should remove item and redirect to index page" do 
		item = Item.create(item_attributes)
		visit item_path(item)
		click_link 'Delete Item'
		expect(current_path).to eq(items_path)
		expect(page).not_to have_text(item.name)
	end
end