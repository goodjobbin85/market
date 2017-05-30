require 'rails_helper'

describe ItemsController do 

	before do
		@item = Item.create!(item_attributes)
	end

	context "when not signed in as admin" do 

		before do 
			non_admin = User.create!(user_attributes(admin: false))
			session[:user_id] = non_admin.id
		end

		it "cannot access new" do 
			get :new
			expect(response).to redirect_to(root_url)
		end

		it "cannot access create" do 
			post :create 
			expect(response).to redirect_to(root_url)
		end

		it "cannot access update" do 
			patch :update, params: { id: @item }
			expect(response).to redirect_to(root_url)
		end

		it "cannot access destroy" do 
			delete :destroy, params: { id: @item }
			expect(response).to redirect_to(root_url)
		end
	end
	
end