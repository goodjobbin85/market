require 'rails_helper'

RSpec.describe FavoritesController, type: :controller do

	before do 
		@item = Item.create!(item_attributes)
	end

	context "when not signed in" do 
		before do 
			session[:user_id] = nil
		end

		it "cannot access create" do 
			post :create, params: { item_id: @item }
			expect(response).to redirect_to(new_session_url)
		end

		it "cannot access destroy" do 
			delete :destroy, params: { id: 1, item_id: @item }
			expect(response).to redirect_to(new_session_url)
		end
	end
end
