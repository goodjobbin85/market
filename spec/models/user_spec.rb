require 'rails_helper'

describe "A User" do 
	it "requires a first name" do 
		user = User.new(first_name: "")
		user.valid?
		expect(user.errors[:first_name].any?).to eq(true)
	end 

	it "requires a last name" do 
		user = User.new(last_name: "")
		user.valid?
		expect(user.errors[:last_name].any?).to eq(true)
	end

	it "requires a phone number" do 
		user = User.new(phone: "")
		user.valid?
		expect(user.errors[:phone].any?).to eq(true)
	end

	it "requires an address" do 
		user = User.new(address: "")
		user.valid?
		expect(user.errors[:address].any?).to eq(true)
	end

	it "requires an email" do 
		user = User.new(email: "")
		user.valid?
		expect(user.errors[:email].any?).to eq(true)
	end

	it "requires an email to be unique" do 
		user1 = User.new(user_attributes)
		user1.save
		user2 = user1.dup
		user2.save
		expect(user2.errors[:email].any?).to eq(true)
	end

	it "is valid with example attributes" do 
		user = User.new(user_attributes)
		expect(user.valid?).to eq(true)
	end

	it "requires a password" do 
		user = User.new(password: "")
		user.valid?
		expect(user.errors[:password].any?).to eq(true)
	end 

	it "requires a password confirmation" do 
		user = User.new(password: "secret", password_confirmation: "")
		user.valid?
		expect(user.errors[:password_confirmation].any?).to eq(true)
	end

	it "requires matching passwords" do 
		user = User.new(password: "secret", password_confirmation: "water")
		user.valid?
		expect(user.errors[:password_confirmation].any?).to eq(true)
	end

	it "requires a password and matching password when creating" do 
		user = User.create!(user_attributes(
							password: "secret",
							password_confirmation: "secret"))
		expect(user.valid?).to eq(true)
	end

	it "does not require a password when updating" do 
		user = User.create!(user_attributes)
		user.password = ""
		expect(user.valid?).to eq(true)
	end 


	it "accepts properly formatted emails" do 
		valid_email = %w[td22@hot.cd ddf3.@j.jj tom@google.com ]
		valid_email.each do |email|
			user = User.new(email: email)
			user.valid?
			expect(user.errors[:email].any?).to eq(false)
		end
	end

	it "does not accept improperly formatted emails" do 
		invalid_emails = %w[ddddddd !!?.pgm ?.@@.com]
		invalid_emails.each do |email|
			user = User.new(email: email)
			user.valid?
			expect(user.errors[:email].any?).to eq(true)
		end
	end



	it "automatically encrypts password into password digest attribute" do 
		user = User.new(password: "secret")
		expect(user.password_digest.present?).to eq(true)
	end

	it "has reviews" do
		user = User.new(user_attributes)
		item1 = Item.new(item_attributes(name: "tomato")) 
		item2 = Item.new(item_attributes(name: "cucumber"))

		review1 = item1.reviews.new(stars: 5, comment: "yummmy!! very delicious!")
		review1.user = user
		review1.save!

		review2 = item2.reviews.new(stars: 2, comment: "not too bad but could be better")
		review2.user = user 
		review2.save!

		expect(user.reviews).to include(review1)
		expect(user.reviews).to include(review2)
	end
end 

describe "Authenticate" do 
	before do 
		@user = User.create!(user_attributes)
	end

	it "returns non-true value if email does not match" do 
		expect(User.authenticate("nomatch", @user.password)).not_to eq(true)
	end

	it "returns non-true if passwords do not match" do 
		expect(User.authenticate(@user.email, "nomatch")).not_to eq(true)
	end

	it "returns the user if email and password match" do 
		expect(User.authenticate(@user.email, @user.password)).to eq(@user)
	end
end

