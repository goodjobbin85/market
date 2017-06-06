require 'rails_helper'

describe "Favoriting an item" do 
	before do 
		@user = User.create!(user_attributes)
		sign_in(@user)
	end

	it "creates a favorite for signed-in use and shows unfav button" do 
		item = Item.create!(item_attributes)

		visit item_url(item)

		expect(page).to have_text("0 fans")

		expect {
			click_button 'Fave'
		}.to change(@user.favorites, :count).by(1)

		expect(current_path).to eq(item_path(item))

		expect(page).to have_text("Thanks for fav'ing!")
		expect(page).to have_text("1 fan")
		expect(page).to have_button("Unfave")
	end
end