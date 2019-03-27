class Admin::UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_param)

    if @user.save
      flash.notice = "ユーザー「#{@user.name}」を登録しました。"
      redirect_to admin_user_index_path
    else
      render :new
    end
  end
  

  def edit
    @user = User.find(params[:id])
  end

  def show
    @user = User.find(params[:id])
    @user.update(user_param)
    flash.notice = "ユーザー「#{@user.name}」を更新しました。"
    redirect_to admin_user_index_path
  end

  def index
  end

  private
   
  def user_param
    params.require(:user).permit(:name, :email, :admin, :password, :password_confirmation)
  end
end
