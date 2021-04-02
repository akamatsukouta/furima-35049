class Item < ApplicationRecord
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
    validates :product_status_id
    validates :shipping_charge_id
    validates :prefecture_id
    validates :days_to_idea_id
    validates :category_id
    validates :user_id

    with_options format: {with: VALID_PRICEL_HALF}, numericality: { only_integer: true, greater_than: 300, less_than: 10000000 } do
      validates :price
    end
  end
 
 
end
