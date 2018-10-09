class LikesController < ApplicationController
  def create
    @user = current_user
    @secret = Secret.find(params[:id])
    @like = Like.create(user: @user, secret: @secret)
    if @like.save
      redirect_to secrets_path
    else
      flash[:errors] = @like.errors.full_messages
      redirect_to secrets_path
    end
  end

  def destroy
    @secret = Secret.find(params[:id])
    Like.find_by(user: current_user, secret: @secret).delete
    redirect_to secrets_path
  end
end
