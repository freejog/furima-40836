class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_one :order
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :item_state
  belongs_to :charge
  belongs_to :prefecture
  belongs_to :day

  validates :image,         presence: true
  validates :item_name,     presence: true, length: { maximum: 40 }
  validates :description,   presence: true, length: { maximum: 1000 }
  validates :category_id,   numericality: { other_than: 0, message: "can't be blank" }
  validates :item_state_id, numericality: { other_than: 0, message: "can't be blank" }
  validates :charge_id,     numericality: { other_than: 0, message: "can't be blank" }
  validates :prefecture_id, numericality: { other_than: 0, message: "can't be blank" }
  validates :day_id,        numericality: { other_than: 0, message: "can't be blank" }

  with_options presence: true, format: { with: /\d/ } do
    validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 },
                      presence: { message: "can't be blank" }
  end
  # 以下、いいね機能の追加実装
  has_many :likes

  def liked_by?(user)
    likes.where(user_id: user.id).exists?
  end
end
