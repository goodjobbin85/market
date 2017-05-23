require 'rails_helper'

describe "viewing a user's profile page" do 

	it "shows the users details" do 
		user1 = User.create!(user_attributes)

		visit user_url(user1)

		expect(page).to have_text(user1.first_name)
		expect(page).to have_text(user1.last_name)
		expect(page).to have_text(user1.email)
	end
end