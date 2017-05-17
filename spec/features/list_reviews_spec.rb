require 'rails_helper'

describe "Listing reviews" do 

	it "should show a list of item's reviews" do 
		item1 = Item.create(item_attributes(name: "tomato"))
		review1 = item1.reviews.create(review_attributes(name: "tom"))
		review2 = item1.reviews.create(review_attributes(name: "cindy"))

		item2 = Item.create(item_attributes(name: "cucumber"))
		review3 = item2.reviews.create(review_attributes(name: "lucy"))

		visit item_reviews_url(item1)
		expect(page).to have_text(review1.name)
		expect(page).to have_text(review2.name)
		expect(page).not_to have_text(review3.name)
	end 
end 