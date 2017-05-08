def item_attributes(overrides = {})
	{
		name: "tomato",
		price: 1.49,
		quantity: 450,
		description: "very very organic"
	}.merge(overrides)
end