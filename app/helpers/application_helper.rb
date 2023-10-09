module ApplicationHelper

  # タイトルをページごとに変える
  def page_title(page_title = '', admin = false)
    base_title = if admin
                   'DriveStart02 （管理画面）'
                 else
                   'DriveStart02'
                 end

    page_title.empty? ? base_title : page_title + " | " + base_title
  end

  # アクティブ機能
  def active_if(path)
    path == controller_path ? 'active' : ''
end
end