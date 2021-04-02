class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  #has_many :items
  #has_many :purchase_manegements       
  
 with_options presence: true do

   validates :nickname
   validates :email

  with_options numericality: { with: VALID_PASSWORD_REGEX }, length: {minimum: 6} do
   VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{6,}+\z/i
   validates :password
  end

   with_options format: {with: /\A[\p{katakana} ー－&&[^ -~｡-ﾟ]]+\z/, message: "全角カタカナのみで入力して下さい"} do
    validates :first_name_kana
    validates :family_name_kana
   end
  
   with_options format: { with: /\A[ぁ-んァ-ン一-龥々ー]+\z/, message: 'に全角文字を使用してください' } do
    validates :family_name
    validates :first_name
   do

   validates :birth_day

 end
end
