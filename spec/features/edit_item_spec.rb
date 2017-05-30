require 'rails_helper'

describe "editing an item" do 

	before do 
		admin = User.create!(user_attributes(admin: true))
		sign_in(admin)
	end

	it "should show edit form and updated info" do 
		item = Item.create(item_attributes)

		visit item_path(item)

		click_link "Edit"
		expect(current_path).to eq(edit_item_path(item))
		expect(find_field('Name').value).to eq(item.name)
		fill_in 'Quantity', with: "7"
		click_button 'Update Item'
		expect(current_path).to eq(item_path(item))
		expect(page).to have_text("7")
		expect(page).to have_text("Item Successfully Updated!")
	end
end