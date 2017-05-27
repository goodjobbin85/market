require 'rails_helper'

describe "viewing list of viewers" do 
	it "shows the users" do 
		user1 = User.create!(user_attributes(first_name: "larry", email: "larry@exammpl.com"))
		user2 = User.create!(user_attributes(first_name: "Curly", email: "curly@example.com"))
		user3 = User.create!(user_attributes(first_name: "shemp", email: "shemp@example.com"))

		sign_in(user1)
		
		visit users_url
		expect(page).to have_link(user1.first_name)
		expect(page).to have_link(user2.first_name)
		expect(page).to have_link(user3.first_name)
	end
end