class ReviewsController < ApplicationController

before_action :set_review

	def index 
		@reviews = @item.reviews
	end

	def new 
		@review = @item.reviews.new
	end 

	def create 
		@review = @item.reviews.new(review_params)
		if @review.save
			redirect_to item_reviews_path(@item),
					notice: "Thanks for your review!"
		else 
			render :new
		end
	end

	private 

	def set_review
		@item = Item.find(params[:item_id])
	end

	def review_params
		params.require(:review).permit(:name, :comment, :stars)
	end

end
