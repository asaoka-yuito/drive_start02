class ProfilesController < ApplicationController
  before_action :set_user,only: %i[edit update]

  def edit;end

  def update
    if @user.update(user_params)
      redirect_to profile_path,success: t('profiles.edit.message.created', item: User.model_name.human)
    else
      flash.now[:danger] =t('profiles.edit.message.not_created', item: User.model_name.human)
      render :edit
    end
  end

private
  def set_user
    @user = User.find(current_user.id)
  end

  def user_params
    params.require(:user).permit(:email,:first_name,:last_name,:avater,:avater_cash)
  end 
end
