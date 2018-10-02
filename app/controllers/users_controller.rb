class UsersController < ApplicationController
  def new
  end

  def create
    @user = User.new(name: params[:Name], email: params[:Email], password: params[:Password], password_confirmation: params[:Password_Confirmation])
    if @user.save
      session[:user_id] = @user.id
      redirect_to new_session_path
    else
      flash[:errors] = @user.errors.full_messages
      redirect_to new_user_path
    end
  end

  def show
    @user = User.find(session[:user_id])
  end

  def edit
  end
end
