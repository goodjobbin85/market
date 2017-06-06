require 'rails_helper'

describe "An Item" do 

	it "requires a name" do 
		item = Item.new(name: "")
		item.valid?
		expect(item.errors[:name].any?).to eq(true)
	end

	it "cannot have duplicate names" do 
		item1 = Item.new(item_attributes)
		item1.save
		item2 = item1.dup
		item2.save
		expect(item2.errors[:name].any?).to eq(true)
	end

	it "requires a nonblank price" do 
		item = Item.new(price: "")
		item.valid?
		expect(item.errors[:price].any?).to eq(true)
	end

	it "requires a nonnegative price" do 
		item = Item.new(price: -12.5)
		item.valid?
		expect(item.errors[:price].any?).to eq(true)
	end

	it "requires a numerical value for price" do 
		item = Item.new(price: "abc")
		item.valid?
		expect(item.errors[:price].any?).to eq(true)
	end

	it "requires an integer value for quantity" do 
		item = Item.new(quantity: 12.7)
		item.valid?
		expect(item.errors[:quantity].size).to eq(1)
	end

	it "requires a nonnegative value for quantity" do 
		item = Item.new(quantity: -5.0)
		item.valid?
		expect(item.errors[:quantity].any?).to eq(true)
	end

	it "requires a description of > 20 characters" do 
		item = Item.new(description: "R" * 20)
		item.valid?
		expect(item.errors[:description].any?).to eq(true)

		item2 = Item.new(description: "E" * 5)
		item2.valid?
		expect(item2.errors[:description].any?).to eq(true)

	end

	it "has many reviews" do 
		item = Item.new(item_attributes)

		review1 = item.reviews.new(review_attributes)
		review2 = item.reviews.new(review_attributes)

		expect(item.reviews).to include(review1)
		expect(item.reviews).to include(review2)

	end 

	it "deletes associated reviews" do 
		item = Item.create(item_attributes)
		item.reviews.create(review_attributes)

		expect {
			item.destroy
		}.to change(Review, :count).by(-1)
	end 

	it "has fans" do 
		item = Item.new(item_attributes)

		fan1 = User.new(user_attributes(email: "td1729@hotmail.com"))
		fan2 = User.new(user_attributes(email: "kdubiel@google.com"))

		item.favorites.new(user: fan1)
		item.favorites.new(user: fan2)

		expect(item.fans).to include(fan1)
		expect(item.fans).to include(fan2)
	end

end