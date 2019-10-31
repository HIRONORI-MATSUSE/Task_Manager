class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
#ログインせずにユーザーページに入るのを制限するコード
#ログインユーザーがnilだった場合ログインページへ飛ぶ。
  def authenticate_user
    if @current_user == nil
    redirect_to("/login")
    end
  end

end
