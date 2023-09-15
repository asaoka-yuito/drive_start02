module ApplicationHelper

  # タイトルをページごとに変える
  def page_title(page_title = '')
    base_title = 'DriveStart02'

    page_title.empty? ? base_title : page_title + " | " + base_title
  end
end