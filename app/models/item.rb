class Item < ApplicationRecord
  validates :title, presence: true
  validates :description, presence: true
  validates :category_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :condition_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :shipping_fee_payer_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :processing_time_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :price, presence: true
  validates :price, numericality: { only_integer: true, message: "isn't integer" }
  validates :price,
            numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: 'is out of setting range' }
  validates :image, presence: true

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :prefecture
  belongs_to :Processing_time
  belongs_to :shipping_fee_payer

  belongs_to :user
  has_one_attached :image
  has_one :purchase
end
