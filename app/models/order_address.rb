class OrderAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :street, :building, :phone_number, :user_id, :item_id

  with_options presence: true do
    validates :user_id, :city, :street
    validates :postal_code,format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :phone_number, format: { with: /\A\d{10,11}\z/, message: "enter 10 or 11 digits" }
  end
    validates :prefecture_id, numericality: {other_than: 1, message: "can't be blank"}

  def save
       order = Order.create(item_id: item_id, user_id: user_id)
       Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, street: street, building: building, phone_number: phone_number,order_id: order.id)
  end
end