require 'rails_helper'

describe "signing a user in" do 

	it "prompts user for email and password" do 
		visit root_url

		click_link "Sign In"
		expect(current_path).to eq(new_session_path)

		expect(page).to have_field("Email")
		expect(page).to have_field("Password")
	end

	it "signs user in with valid email/password combination" do 
		user = User.create!(user_attributes)

		visit root_url
		click_link "Sign In"

		fill_in "Email", with: user.email
		fill_in "Password", with: user.password

		click_button "Sign In"

		expect(current_path).to eq(user_path(user))
		expect(page).to have_text("Welcome back, #{user.first_name}!")

		expect(page).to have_link(user.first_name)
		expect(page).not_to have_link('Sign In')
		expect(page).not_to have_link('Sign Up')
		expect(page).to have_link('Sign Out')
	end

	it "does not sign in invalid email/password combo" do 
		user = User.create!(user_attributes)

		visit root_url

		click_link "Sign In"

		fill_in "Email", with: user.email
		fill_in "Password", with: "no match"

		click_button "Sign In"

		expect(page).to have_text("Invalid email/password combination!")

		expect(page).not_to have_link(user.first_name)
		expect(page).to have_link('Sign In')
		expect(page).to have_link('Sign Up')
		expect(page).not_to have_link('Sign Out')
	end 
end