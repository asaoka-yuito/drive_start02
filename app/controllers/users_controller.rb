class UsersController < ApplicationController
  skip_before_action :require_login, only: %i[ create new ]
  
  def new
    @user = User.new
  end

  def show;end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to login_path 
      flash[:notice] = "ユーザーの作成に成功しました"
    else
      flash.now[:danger] = "ユーザーの作成に失敗しました"
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name,:last_name,:email, :password, :password_confirmation)
  end
end
