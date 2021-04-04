require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    context '出品できるとき' do
     it '全ての項目(image, name, price, explanation, product_status_id, shipping_charge_id, prefecture_id, days_to_idea_id, category_id, user_id)が存在すれば出品できる' do
       expect(@item).to be_valid
     end
    end
    context '出品できないとき' do
     it '商品画像がないときは出品できない' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
     end
     it '商品名が空の時登録できない' do
      @item.name = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
     end
     it '商品の説明がないときは出品できない' do
      @item.explanation = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Explanation can't be blank")
     end
     it 'カテゴリーの情報がないときは出品できない' do
      @item.category_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Category must be other than 1")
     end
     it '商品の情報がないときは出品できない' do
      @item.product_status_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Product status must be other than 1")
     end
     it '配送料の負担についての情報がないときは出品できない' do
      @item.shipping_charge_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping charge must be other than 1")
     end
     it '発送元の地域についての情報がないときは出品できない' do
      @item.prefecture_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Prefecture must be other than 1")
     end
     it '発送までの日数についての情報がないときは出品できない' do
      @item.days_to_idea_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Days to idea must be other than 1")
     end
     it '販売価格についての情報がないときは出品できない' do
      @item.price = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank", "Price is not a number")
     end
     it '販売価格が300円以下の場合は出品できない' do
      @item.price = 299
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
     end
     it '販売価格が9999999円以上の場合は出品できない' do
      @item.price = 10000000
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be less than 10000000")
     end
     it '販売価格が半角数字じゃない場合は出品できない' do
      @item.price = '３００'
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not a number")
     end
     it '商品価格が半角英数字混合では登録できない' do
      @item.price = '3２０'
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not a number")
     end
     it '商品価格が半角英字のみでは登録できない' do
      @item.price = 'aaa'
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not a number")
     end
    end
  end
end