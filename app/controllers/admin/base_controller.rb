class Admin::BaseController < ApplicationController
  layout 'admin/layouts/application'    
  bofore_action :check_admin
  


  private



  def not_authenticated
    redirect_to admin_login_path, warning: t('defaults.message.require_login')
  end

  def check_admin
    redirect_to root_path, warning: t('defaults.message.not_authorized') unless current_user.admin?
  end
end
