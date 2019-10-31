class UsersController < ApplicationController
  before_action :set_user, only: [:show]
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(session[:user_id])
    else
      render 'new'
    end
  end

  def show
  end

  def ensure_correct_user
    if @user.id != current_user.id 
      flash[:notice] = "権限がありません"
      redirect_to pictures_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :user_image, :user_image_cache)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
