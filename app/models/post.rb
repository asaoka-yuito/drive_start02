class Post < ApplicationRecord
  mount_uploader :post_image, PostImageUploader
  belongs_to :user
  has_many :comments, dependent: :destroy

  # アソシエーションを確認

  validates :title, presence: true, length: { maximum: 255 }
	validates :body, presence: true, length: { maximum: 65_535 }


  # Ransackv4.0.0から属性と関連付けの明示的な許可が必要になった（許可するカラムを書く）
  def self.ransackable_attributes(auth_object = nil)
    ["body", "created_at", "id", "post_image", "title", "updated_at", "user_id"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["comments", "user"]
  end

end
