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
		user = User.create!(first_name: "tomm",
							last_name: "dubiel",
							phone: "423333",
							address: "4454544",
							email: "td1729@hotmail.com",
							password: "secret",
							password_confirmation: "secret")
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
end 

