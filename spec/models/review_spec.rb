require 'rails_helper'

describe "A Review" do 

	it "should belong an item" do 
		item = Item.create(item_attributes)
		review = item.reviews.new(review_attributes)
		expect(review.item).to eq(item)
	end

	it "with example attributes is valid" do 
		item = Item.create(item_attributes)
		review = Review.new(review_attributes)
		review.item = item
		expect(review.valid?).to eq(true) 
	end

	it "requires a comment" do 
		review = Review.new(comment: "")
		review.valid?
		expect(review.errors[:comment].any?).to eq(true)
	end

	it "requires a comment between 10 and 100 characters" do 
		review1 = Review.new(comment: "r" * 9)
		review1.valid?
		expect(review1.errors[:comment].any?).to eq(true)

		review2 = Review.new(comment: "r" * 101)
		review2.valid?
		expect(review2.errors[:comment].any?).to eq(true)
	end

	it "accepts star values of 1 through 5" do 
		stars = [1, 2, 3, 4, 5]
		stars.each do |star|
			review = Review.new(stars: star)
			review.valid?
			expect(review.errors[:stars].any?).to eq(false)
		end
	end

	it "rejects invalid star values" do 
		stars = [-1, 0, 6]
		stars.each do |star|
			review = Review.new(stars: star)
			review.valid?
			expect(review.errors[:stars].any?).to eq(true)
		end
	end
end