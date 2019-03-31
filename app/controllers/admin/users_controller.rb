class Admin::UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_param)

    if @user.save
      flash.notice = "ユーザー「#{@user.name}」を登録しました。"
      redirect_to admin_users_path
    else
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_param)
      flash.notice = "ユーザー「#{@user.name}」を更新しました。"
      redirect_to admin_user_path(@user)
    else
      render :new
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash.notice = "ユーザ「#{@user.name}」を削除しました。"
    redirect_to admin_users_path
  end

  private

  def user_param
    params.require(:user).permit(:name, :email, :admin, :password, :password_confirmation)
  end
end