class User < ApplicationRecord
  authenticates_with_sorcery!
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
  has_many :bookmark_posts, through: :bookmarks, source: :post
  # アソシエーションを確認

  validates :password, length: { minimum: 3 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }

  validates :email, uniqueness: true, presence: true
  validates :last_name, presence: true, length: { maximum: 255 }
  validates :first_name, presence: true, length: { maximum: 255 }
  validates :reset_password_token, presence: true, uniqueness: true, allow_nil: true

  #  コメントした本人だけ削除可能
  # インスタンスメソッド
  def own?(object)
    object.user_id == id
  end
  
  def change_email(email_after)
    self.email = email_after
  end

  # ブックマークする処理と、ブックマークしたか判定をする処理
  def bookmark(post)
    bookmark_posts << post
  end

  def unbookmark(post)
    bookmark_posts.destroy(post)
  end

  def bookmark?(post)
    bookmark_posts.include?(post)
  end
end
