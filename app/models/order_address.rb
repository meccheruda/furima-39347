class OrderAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture, :city, :street, :building, :phone_number, :user_id

  with_options presence: true do
    validates :user_id, :city, :street
    validates :postal_code,format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :phone_number,format: {without: /\D/, message: "enter numbers only"}
  end
    validates :prefecture, numericality: {other_than: 1, message: "can't be blank"}

  def save
       order = Order.create(item_id: item, user_id: user_id)
       Address.create(postal_code: postal_code, prefecture: prefecture, city: city, street: street, building: building, phone_number: phone_number,order_id: order.id)
  end
end