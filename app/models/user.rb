class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :items
  has_many :purchase_manegements       
  
  with_options presence: true do

   validates :nickname, presence: true
   validates :email, presence: true

 VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{6,}+\z/i
   validates :password, presence: true, format: { with: VALID_PASSWORD_REGEX }, length: {minimum: 6}

 with_options presence: true, format: {with: /\A[\p{katakana} ー－&&[^ -~｡-ﾟ]]+\z/, message: "全角カタカナのみで入力して下さい"} do       
   validates :first_name_kana, presence: true
   validates :family_name_kana, presence: true
 end
  
 with_options presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: 'に全角文字を使用してください' } do
   validates :family_name, presence: true
   validates :first_name, presence: true
 end

   validates :birth_day, presence: true
   
end
end
