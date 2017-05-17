class ReviewsController < ApplicationController
	def index 
		@item = Item.find(params[:item_id])
		@reviews = @item.reviews
	end
end
