class Order
  include ActiveModel::Model
  attr_accessor :token, :user_id, :item_id, :postal_code, :prefecture_id, :municipality, :address, :building, :phone_number

  validates :token, :user_id, :item_id, :postal_code, :prefecture_id, :municipality,
            :address, :phone_number, presence: true

  validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Enter it as follows (e.g. 123-4567)' }

  validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }

  validates :phone_number, numericality: { only_integer: true, message: 'is invalid. Input only number' }

  validates :phone_number, length: { minimum: 10, message: 'is too short' }

  validates :phone_number, length: { maximum: 11, message: 'is too long' }

  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    ShippingAddresse.create(postal_code: postal_code, prefecture_id: prefecture_id, municipality: municipality,
                            address: address, building: building, phone_number: phone_number, purchase_id: purchase.id)
  end
end
