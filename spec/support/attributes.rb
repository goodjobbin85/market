def item_attributes(overrides = {})
	{
		name: "tomato",
		price: 1.49,
		quantity: 450,
		description: "very very organic",
		in_season: true
	}.merge(overrides)
end