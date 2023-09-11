class ApplicationController < ActionController::Base
  
  #すべてのページでログインを必須にする 
  before_action :require_login

  private
  # ログインをしていない場合の処理
  def not_authenticated
    redirect_to login_path, alert: 'ログインしてください。'
  end
end
