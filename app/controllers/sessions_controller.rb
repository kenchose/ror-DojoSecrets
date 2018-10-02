class SessionsController < ApplicationController
  def new
      # render login page
  end
  def create
      # Log User In
      # if authenticate true
          # save user id to session
          # redirect to users profile page
      # if authenticate false
          # add an error message -> flash[:errors] = ["Invalid"]
          # redirect to login page
    @user = User.find_by(email: params[:Email])
    if @user && @user.authenticate(params[:Password])
      session[:user_id] = @user.id
      redirect_to @user
    else
      flash[:error] = ["Invalid Combination"]
      redirect_to '/users'
    end
  end
  def destroy
      # Log User out
      # set session[:user_id] to null
      # redirect to login page
  end
end