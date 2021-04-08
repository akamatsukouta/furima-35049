class DestinationPurchaseManagement
  include ActiveModel::Model
  attr_accessor :post_code, :prefecture_id, :city, :address, :building_name, :phone_number, :user_id, :item_id, :token

  with_options presence: true do
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :city, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "is invalid. Input full-width characters."}
    validates :address
    validates :phone_number,  format: {with: /\A\d{10}\z|\A\d{11}\z/ , message: "is invalid."}
    validates :prefecture_id, numericality: { other_than: 1 }
    validates :token
    validates :user_id
    validates :item_id
    
  end
  
  def save
    purchase_management = PurchaseManagement.create(user_id: user_id, item_id: item_id)
    Destination.create(purchase_management_id: purchase_management.id, post_code: post_code, prefecture_id: prefecture_id, city: city, address: address, building_name: building_name, phone_number: phone_number)
  end
end