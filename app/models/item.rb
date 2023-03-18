class Item < ApplicationRecord
  validates :title, presence: true
  validates :description, presence: true
  validates :category_id, presence: true
  validates :condition_id, presence: true
  validates :shipping_fee_payer_id, presence: true
  validates :prefecture_id, presence: true
  validates :processing_time_id, presence: true
  validates :price, presence: true

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :prefecture
  belongs_to :Processing_time
  belongs_to :shipping_fee_payer

  belongs_to :user
end
