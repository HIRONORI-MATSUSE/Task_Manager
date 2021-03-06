class Admin::UsersController < ApplicationController
  # before_action :admin_user
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  # before_action :require_admin

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to admin_user_path(session[:user_id]),notice: "ユーザー「#{@user.name}を登録しました」"
    else
      render 'new'
    end
  end

  def show
  end


  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to admin_users_path, notice: '編集しました'
    else
      render 'edit'
    end
  end

  def destroy
    if User.find(params[:id]).destroy
      flash[:success] = "ユーザー削除完了"
      redirect_to admin_users_path
    else
      redirect_to admin_users_path
      flash[:success] = "ユーザー削除出来ません"
    end
  end

  private

  def user_params
    params.require(:user).permit( :name, :email, :password, :password_confirmation, :admin)
  end

  def set_user
    @user = User.find(params[:id])
  end

  def require_admin
    redirect_to sessions_path unless current_user.admin?
  end


end
