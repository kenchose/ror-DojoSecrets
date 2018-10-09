require 'rails_helper'
RSpec.describe UsersController, type: :controller do
  before do
    @user = create(:user)
  end
  context "when not logged in" do
    before do
      session[:user_id] = nil
    end
    it "cannot access show" do 
      get :show, id: @user
      expect(response).to redirect_to(new_session_path)
    end
    it "cannot access edit" do
      get :edit, id:@user
      expect(response).to redirect_to(new_session_path)
    end
    it "cannot access update" do 
      get :update, id: @user
      expect(response).to redirect_to(new_session_path)
    end
    it "cannot access destroy" do
      get :destroy, id: @user
      expect(response).to redirect_to(new_session_path)
    end
  end
  context "when signed in as the wrong user" do
    before do
      @user2 = create(:user, name:"Zack Tran", email:"zack@tran.com")
      session[:user_id] = @user.id
    end
    it "cannot access profile page another user" do 
      get :show, id: @user2
      expect(response).to redirect_to(user_path(@user))
    end
    it "cannot access the edit page of another user" do 
      get :edit, id: @user2
      expect(response).to redirect_to(user_path(@user))
    end
    it "cannot update another user" do 
      get :update, id: @user2
      expect(response).to redirect_to(user_path(@user))
    end
    it "cannot destroy another user" do
      get :destroy, id: @user2
      expect(response).to redirect_to(user_path(@user))
    end
  end
end