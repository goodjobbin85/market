def item_attributes(overrides = {})
	{
		name: "tomato",
		price: 1.49,
		quantity: 450,
		description: "very very organicccccy",
		in_season: true
	}.merge(overrides)
end

def user_attributes(overrides = {})
	{
		first_name: "paul",
		last_name: "dubiel",
		phone: "312-401-4570",
		address: "9323 S. Springfield",
		email: "blockkids08@hotmail.com",
		password: "secret",
		password_confirmation: "secret"
	}.merge(overrides)
end

def review_attributes(overrides = {})
	{
		comment: "best damn apples I ever had!",
		stars: 4
	}.merge(overrides)
end

