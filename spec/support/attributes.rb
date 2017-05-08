def item_attributes(overrides = {})
	{
		name: "tomato",
		price: 1.49,
		quantity: 450
	}.merge(overrides)
end