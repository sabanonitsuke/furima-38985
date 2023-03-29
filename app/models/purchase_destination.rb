class PurchaseDestination
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :prefecture_id, :city, :house_number, :building_name, :phone_number, :token

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'は正しい形式で入力してください(例:123-4567)' }
    validates :city
    validates :house_number
    validates :phone_number, length: { in: 10..11, message: 'が短すぎます' },
                             numericality: { only_integer: true, message: 'は半角数字のみで入力してください' }
    validates :token
  end
  validates :prefecture_id, numericality: { other_than: 1, message: "を選択してください" }

  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    Destination.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, house_number: house_number,
                       building_name: building_name, phone_number: phone_number, purchase_id: purchase.id)
  end
end
