class BookmarksController < ApplicationController
  # あとで確認
  # ルーティングとパラメーターを取得の確認
  # current_userに紐付いたお気に入りを今のパラメーター(bookmarks/:id)から持ってきて、その掲示板レコードを取得している
  # 後ろの.boardは掲示板レコードをとってきてる
  # コードが分からなかったので、rails consoleで試してみた。疑問があったら試す癖をつけたい。
  # paramsは頭が混乱するので,、設定したルーティングとurlを意識する

  def create
    post = Post.find(params[:post_id])
    current_user.bookmark(post)
    redirect_back fallback_location: root_path, success: t('defaults.message.bookmark')
  end

  def destroy
    post = current_user.bookmarks.find(params[:id]).post
    current_user.unbookmark(post)
    redirect_back fallback_location: root_path, success: t('defaults.message.unbookmark')
  end

  # redirect_back fallback_location: root_pathでユーザーを直前のページに戻せる 

end