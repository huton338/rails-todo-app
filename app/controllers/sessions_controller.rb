class SessionsController < ApplicationController
  skip_before_action :login_required

  def new
  end

  def create
    user = User.find_by(email: session_params[:email])

    if user&.authenticate(session_params[:password])
      session[:user_id] = user.id
      flash.notice = 'ログインしました。'
      redirect_to root_path
    else
      flash.notice = 'ログインに失敗しました。'
      render :new
    end
  end

  private

  def session_params
    params.require(:session).permit(:email, :password)
  end
end
