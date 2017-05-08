class ItemsController < ApplicationController
	
	def index
		@items = Item.in_season
	end

	def show
		@item = Item.find(params[:id])
	end

	def edit 
		@item = Item.find(params[:id])
	end

	def update 
		@item = Item.find(params[:id])
		@item.update(item_params)
		redirect_to item_path(@item)
	end

	def new
		@item = Item.new
	end

	def create 
		@item = Item.new(item_params)
		@item.save
		redirect_to @item
	end

	def destroy 
		@item = Item.find(params[:id])
		@item.destroy
		redirect_to items_path
	end

	private

	def item_params
		params.require(:item).permit(:name, :quantity, :price, :description, :in_season)
	end

	
	
	
end
