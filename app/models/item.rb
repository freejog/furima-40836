class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :item_state
  belongs_to :charge
  belongs_to :prefecture
  belongs_to :day

  validates :image,         presence: true
  validates :item_name,     presence: true, length: { maximum: 40 }
  validates :description,   presence: true, length: { maximum: 1000}
  validates :category_id,   numericality: { message: "can't be blank"}
  validates :item_state_id, numericality: { message: "can't be blank"}
  validates :charge_id,     numericality: { message: "can't be blank"}
  validates :prefecture_id, numericality: { message: "can't be blank"}
  validates :day_id,        numericality: { message: "can't be blank"}


  with_options presence: true, format: { with: /\d/ } do
    validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}, presence: { message: "can't be blank" }
  end

end
