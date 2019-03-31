class ApplicationController < ActionController::Base
  # helplper_method:viewでもcontrollerのメソッドを使用できる
  helper_method :current_user
  before_action :login_required

  private

  # ||=の演算子は x||=1　→　x || x=1 である
  # xがnilの場合左がfalseとなりx=1,xに値を持っている場合右がfalseとなりxの値のまま
  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def login_required
    redirect_to login_path unless current_user
  end
end
