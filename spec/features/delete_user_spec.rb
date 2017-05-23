require 'rails_helper'

describe "deleting user account" do 

	it "destroys the user and redirects to home page" do 
		user = User.create!(user_attributes)

		visit user_path(user)

		click_link "Delete Account"

		expect(current_path).to eq(root_path)
		expect(page).to have_text("Account Successfully Deleted!")
		visit users_path
		expect(page).not_to have_text(user.first_name)
	end 
end