class Bookmark < ApplicationRecord
  belongs_to :user
  belongs_to :post
  # アソシエーションを確認

  # uniquenessヘルパー オブジェクトが保存される直前にユニーク（一意、重複していない）であることを検証する
  validates :user_id, uniqueness: { scope: :post_id }
end
