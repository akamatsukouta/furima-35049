class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :days_to_ship
  belongs_to :product_status
  belongs_to :shipping_area
  belongs_to :shipping_charge
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_one_attached :image
  belongs_to :user   
  has_one :purchase_management
  

  VALID_PRICEL_HALF = /\A[0-9]+\z/
  with_options presence: true do
    
    validates :name
   
    validates :explanation 
    validates :product_status_id, numericality: { other_than: 1 }
    validates :shipping_charge_id, numericality: { other_than: 1 }
    validates :prefecture_id, numericality: { other_than: 1 }
    validates :days_to_idea_id, numericality: { other_than: 1 }
    validates :category_id, numericality: { other_than: 1 }
    validates :user_id

    with_options format: {with: VALID_PRICEL_HALF}, numericality: { only_integer: true, greater_than: 300, less_than: 10000000 } do
      validates :price
    end
  end
 
  with_options presence: true do 
   validates :category, :text
   validates :days_to_ship, :text
   validates :product_status, :text
   validates :shipping_area, :text
   validates :shipping_charge, :text
  end
   
end
