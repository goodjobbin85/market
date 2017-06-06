require 'rails_helper'

describe "Unfavoriting an item" do 
	before do 
		@user = User.create!(user_attributes)
		sign_in(@user)
	end

	it "deletes the favorite and shows the Fave button" do 
		item = Item.create!(item_attributes)

		visit item_url(item)
		click_button 'Fave'

		expect(page).to have_text("1 fan")

		expect {
			click_button 'Unfave'
		}.to change(@user.favorites, :count).by(-1)

		expect(current_path).to eq(item_path(item))

		expect(page).to have_text("Sorry you unfaved it!")
		expect(page).to have_text("0 fans")
		expect(page).to have_button("Fave")
	end
end