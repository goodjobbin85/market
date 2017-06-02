require 'rails_helper'

describe "creating a new review" do 

	before do 
		@user = User.create!(user_attributes)
		sign_in(@user)
	end

	it "saves the review" do 
		item = Item.create(item_attributes)
		visit item_url(item)
		click_link "Write Review"
		expect(current_path).to eq(new_item_review_path(item))

		select 3, :from => "review_stars"
		fill_in "Comment", with: "Holy moly macaroni"

		click_button "Post Review"

		expect(page).to have_text("Thanks for your review!")
	end 

	it "does not save invalid review" do 
		item = Item.create(item_attributes)
		visit new_item_review_url(item)
		expect {
			click_button 'Post Review'
		}.not_to change(Review, :count)
	end
end 