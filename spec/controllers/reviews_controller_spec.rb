require 'rails_helper'

describe ReviewsController do 
	before do 
		@item = Item.create!(item_attributes)
	end

	context "when not signed in" do 

		before do 
			session[:user_id] = nil
		end

		it "cannot access index" do 
			get :index, params: { item_id: @item }
			expect(response).to redirect_to(new_session_url)
		end

		it "cannot access create" do 
			post :create, params: { item_id: @item }
			expect(response).to redirect_to(new_session_url)
		end

		it "cannot access new" do 
			get :new, params: { item_id: @item }
			expect(response).to redirect_to(new_session_url)
		end
	end
end