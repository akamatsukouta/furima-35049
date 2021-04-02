class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :items
  has_many :purchase_manegements       
  
 with_options presence: true do

   validates :nickname
   validates :email

  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{6,}+\z/i
   validates :password, format: { with: VALID_PASSWORD_REGEX }, length: {minimum: 6}

     
   validates :first_name_kana, format: {with: /\A[\p{katakana} ー－&&[^ -~｡-ﾟ]]+\z/, message: "全角カタカナのみで入力して下さい"} 
   validates :family_name_kana, format: {with: /\A[\p{katakana} ー－&&[^ -~｡-ﾟ]]+\z/, message: "全角カタカナのみで入力して下さい"} 
 
  
 
   validates :family_name, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: 'に全角文字を使用してください' } 
   validates :first_name, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: 'に全角文字を使用してください' } 
 

   validates :birth_day

 end
end
