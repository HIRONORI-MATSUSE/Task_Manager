class SessionsController < ApplicationController
    before_action :authenticate_user, except:[:new, :create, :destroy]

  def new
  end

=begin
   userという変数の中に、入力されたparams(sessionとemail)をUserモデルのなかから探して入れる。
user = User.find_by(email: params[:session][:email].downcase)&& user.admin
　　もし入力されたuserと登録されているuserのparams(sessionとemail)とuser.adminがtrueだった時、
　　user.idを取得してadmin_users_pathへ送る。
session[:user_id] = user.id
redirect_to admin_users_path
if user && user.authenticate(params[:session][:password])
　　コンソールのrouteをみてadmin_users_pathはidは必要ない
  　user_pathの場合は、特定のidが必要な為、記述する。
redirect_to user_path(user.id)


　　三項演算子の場合(未完成)
     user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
  　 session[:user_id] == user.admin ? redirect_to admin_users_path : redirect_to user_path
=end
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password]) && user.admin
      session[:user_id] = user.id
      redirect_to admin_users_path
    elsif user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      redirect_to user_path(user.id)
    else
      flash[:danger] = 'ログインに失敗しました'
      render 'new'
    end
  end

  def destroy
    session.delete(:user_id)
    flash[:notice] = 'ログアウトしました'
    redirect_to new_session_path
  end
end
