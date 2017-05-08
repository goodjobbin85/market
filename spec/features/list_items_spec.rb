require 'rails_helper'

describe "visiting homepage" do 

	it "should list index of items" do 
		item1 = Item.create(name: "orange",
							price: 1.49,
							quantity: 6989,
							description: "wow")
		item2 = Item.create(name: "kiwi",
							price: 0.80,
							quantity: 911,
							description: "very organic")
		item3 = Item.create(name: "strawberry",
							price: 1.80,
							quantity: 846,
							description: "rich")

		visit items_url
		#expect(page).to include(item.name)
		expect(page).to have_text("Current Available Produce!")
		expect(page).to have_text(item1.name)
		expect(page).to have_text(item2.name)
		expect(page).to have_text(item3.name)

	end
end