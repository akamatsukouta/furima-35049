class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :days_to_ship
  belongs_to :product_status
  belongs_to :prefecture
  belongs_to :shipping_charge
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  
  
  has_one_attached :image
  belongs_to :user
  has_one :purchase_management
  

  
  with_options presence: true do

    validates :image
    validates :name
    validates :explanation 
    
    with_options numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than: 10000000 } do
      validates :price
    end
    
  end

  with_options presence: true, numericality: { other_than: 1 } do
   validates :product_status_id
   validates :shipping_charge_id
   validates :prefecture_id
   validates :days_to_ship_id
   validates :category_id
  end

end
