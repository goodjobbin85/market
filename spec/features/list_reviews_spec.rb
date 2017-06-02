require 'rails_helper'

describe "Listing reviews" do 

	before do 
		@user = User.create!(user_attributes)
		sign_in(@user)
	end

	it "should show a list of item's reviews" do 
		item1 = Item.create!(item_attributes(name: "tomato"))
		review1 = item1.reviews.create!(review_attributes(stars: 3, user: @user))
		review2 = item1.reviews.create!(review_attributes(stars: 5, user: @user))
		
		item2 = Item.create!(item_attributes(name: "cucumber"))
		review3 = item2.reviews.create!(review_attributes(stars: 5, user: @user))
		
		visit item_reviews_url(item1)
		
		expect(page).to have_text(review1.stars)
		expect(page).to have_text(review2.stars)
		expect(page).not_to have_text(review3.stars)
	end 
end 