class UserSessionsController < ApplicationController
  skip_before_action :require_login, only: %i[root create new]

  def new; end

  def create
    @user = login(params[:email], params[:password])

    if @user
      redirect_back_or_to root_path, success: t('user_sessions.create.login')
    else
      flash.now[:danger] = t('user_sessions.create.login_failed')
      render :new
    end
  end

  def destroy
    logout
    redirect_to login_path, success: t('user_sessions.create.logout')
  end
end
