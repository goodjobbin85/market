class FavoritesController < ApplicationController
	before_action :require_signin
	before_action :set_item
	def create 
		@item.favorites.create!(user: current_user)
		redirect_to @item, notice: "Thanks for fav'ing!"
	end

	def destroy 
		favorite = current_user.favorites.find(params[:id])
		favorite.destroy
		redirect_to @item, notice: "Sorry you unfaved it!"
	end

	private

	def set_item
		@item = Item.find(params[:item_id])
	end
end
