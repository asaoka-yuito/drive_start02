class ApplicationController < ActionController::Base
  
  # すべてのページでログインを必須にする 
  before_action :require_login

  # フラッシュメッセージ追加
  add_flash_types :success, :info, :warning, :danger

  private
  # ログインをしていない場合の処理
  def not_authenticated
    redirect_to login_path, danger: 'ログインしてください。'
  end
end
