module SessionsHelper

# current_userを定義しる。＠current_userがtrueであればそのまま。じゃなければログインしている人のIdをさがして@current_userに代入する。
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

#ログインしていないときやマイページなどに飛ばないようにする
  def authenticate_user
    if current_user == nil
      redirect_to root_path
    end
  end


  def admin?
    @user.admin
  end

#ログイン判定する
  def logged_in?
    current_user.present?
  end


end
