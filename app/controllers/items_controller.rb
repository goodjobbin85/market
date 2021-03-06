class ItemsController < ApplicationController
	
	before_action :require_signin, except: [:index, :show]
	before_action :require_admin, except: [:index, :show]

	def index
		case params[:scope]
		when 'in_season'
			@items = Item.in_season
		when 'max_quantity'
			@items = Item.max_quantity
		when 'low_quantity'
			@items = Item.low_quantity
		else 
			@items = Item.all
		end
	end

	def show
		@item = Item.find(params[:id])
		@fans = @item.fans
		@sources = @item.sources

		if current_user
			@current_favorite = current_user.favorites.find_by(item_id: @item.id)
		end
	end

	def edit 
		@item = Item.find(params[:id])
	end

	def update 
		@item = Item.find(params[:id])
		if @item.update(item_params)
			flash[:notice] = "Item Successfully Updated!"
			redirect_to item_path(@item)
		else
			render :edit
		end
	end

	def new
		@item = Item.new
	end

	def create 
		@item = Item.new(item_params)
		if @item.save
			redirect_to @item, notice: "Item Successfully Created!"
		else 
			render :new
		end
	end

	def destroy 
		@item = Item.find(params[:id])
		@item.destroy
		redirect_to items_path, alert: "Item Successfully Deleted!"
	end

	private

	def item_params
		params.require(:item).permit(:name, :quantity, :price, 
									:description, :in_season, source_ids: [])
	end

	
	
	
end
