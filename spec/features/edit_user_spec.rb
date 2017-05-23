require 'rails_helper'

describe "editing a user" do 

	it "updates the user and shows updated info" do 
		user = User.create!(user_attributes)
		visit user_url(user)
		click_link "Edit Account"

		expect(current_path).to eq(edit_user_path(user))
		expect(find_field('Email').value).to eq(user.email)

		fill_in "Email", with: "user@example.com"

		click_button "Update Account"

		expect(page).to have_text("user@example.com")
		expect(page).to have_text('Account Successfully Updated')
	end

	it "does not update the user if invalid" do 
		user = User.create!(user_attributes)

		visit edit_user_path(user)
		fill_in 'Email', with: " "

		click_button "Update Account"

		expect(page).to have_text('error')
	end
end