class Item < ApplicationRecord

  belongs_to :user
  has_one_attached :image

  validates :item_name, :description, :image, :price , presence: true
  validates :category_id, numericality: { other_than: 1, message: "can't be blank"} 
  validates :condition_id, numericality: { other_than: 1, message: "can't be blank"} 
  validates :postage_id, numericality: { other_than: 1, message: "can't be blank"} 
  validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank"} 
  validates :delivery_id, numericality: { other_than: 1, message: "can't be blank"} 
  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }
  validates :price, format: { with: /\A[0-9]+\z/, message: "should be a valid number" }

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture
  belongs_to :category
  belongs_to :condition
  belongs_to :postage
  belongs_to :delivery
end
