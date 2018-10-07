class SecretsController < ApplicationController
  def index
    @secret = Secret.all
    @like = Like.all
    @secrets_liked = current_user.secrets_liked
    @user = current_user
  end

  def create
    @user = User.find(session[:user_id])
    @secret = Secret.new( secret_params )
    if @secret.save
      redirect_to @user
    else
      flash[:errors] = @secret.errors.full_messages
      redirect_to @user
    end
  end

  def destroy
    @user = User.find(session[:user_id])
    # Secret.find(params[:id]).delete
    @secret = Secret.find(params[:id])
    if @user = @secret.user
      @secret.destroy
      redirect_to @user
    end
  end

  private 
    def secret_params
      params.require(:secret).permit(:content, :user_id)
    end
end
