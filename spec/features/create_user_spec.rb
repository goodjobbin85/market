require 'rails_helper'

describe "Creating a new user" do 
	it "saves user and redirects to users profile page" do 
		visit root_url
		click_link "Sign Up"
		expect(current_path).to eq(signup_path)

		fill_in "First name", with: "tom"
		fill_in "Last name", with: "dubiel"
		fill_in "Address", with: "9393988484ds"
		fill_in "Phone", with: "8487575874"
		fill_in "Email", with: "user@example.com"
		fill_in "Password", with: "secret"
		fill_in "Confirm Password", with: "secret"

		click_button "Create Account"

		expect(current_path).to eq(user_path(User.last))

		expect(page).to have_text("user@example.com")
		expect(page).to have_text("Thanks for signing up!")

		expect(page).not_to have_link('Sign In')
		expect(page).not_to have_link('Sign Up')
	end
end