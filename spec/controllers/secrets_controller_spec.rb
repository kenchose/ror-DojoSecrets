require 'rails_helper'
RSpec.describe SecretsController, type: :controller do
  before do
    @user = create(:user)
    @secret = create(:secret, user: @user)
  end
  context "when not logged in" do
    before do
      session[:user_id] = nil
    end
    it "cannot access index" do 
      get :index, id: @user
      expect(response).to redirect_to("/sessions/new")
    end
    it "cannot access create" do 
      get :create, id: @user
      expect(response).to redirect_to("/sessions/new")
    end
    it "cannot access destroy" do
      get :destroy, id: @user
      expect(response).to redirect_to("/sessions/new")
    end
  end
  context "when signed in as the wrong user" do
    before do
      @user2 = create(:user, name:"Zack Tran", email:"zack@tran.com")
      @secret2 = create(:secret, user: @user2)
      session[:user_id] = @user.id
    end
    it "cannot destroy another user's secret" do
      delete :destroy, id: @secret2.id
      expect(response).to redirect_to(user_path(@user2))
    end
  end
end
