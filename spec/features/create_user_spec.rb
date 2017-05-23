require 'rails_helper'

describe "Creating a new user" do 
	it "saves user and redirects to users profile page" do 
		visit root_url
		click_link "Sign Up"
		expect(current_path).to eq(signup_path)

		fill_in "Email", with: "user@example.com"
		fill_in "Password", with: "secret"
		fill_in "Confirm Password", with: "secret"

		click_button "Create Account"

		expect(current_path).to eq(user_path(User.last))

		expect(page).to have_text("user@example.com")
		expect(page).to have_text("Thanks for signing up!")
	end
end