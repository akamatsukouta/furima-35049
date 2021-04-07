require 'rails_helper'

RSpec.describe DestinationPurchaseManagement, type: :model do
  before do
    @destination_purchase_management = FactoryBot.build(:destination_purchase_management)
  end

  describe '購入できる場合' do
    context '保存できるとき' do
     it '全ての項目(user_id, item_id, post_code, prefecture_id, city, address, building_name, phone_number, token)が存在すれば購入できる' do
       expect(@destination_purchase_management).to be_valid
     end
     it '電話番号が11桁いないの場合のみ保存できる' do
      @destination_purchase_management.phone_number = '01207772656'
      expect(@destination_purchase_management).to be_valid
     end
     it '郵便番号にハイフンがある場合のみ保存できる' do
      @destination_purchase_management.post_code = '123-4567'
      expect(@destination_purchase_management).to be_valid
     end
     it 'tokenがあれば保存できる' do
      expect(@destination_purchase_management).to be_valid
     end
    end
    context '保存できないとき' do
      it '郵便番号が空欄の場合保存できない' do
        @destination_purchase_management.post_code = ''
        @destination_purchase_management.valid?
        expect(@destination_purchase_management.errors.full_messages).to include("Post code can't be blank", "Post code is invalid. Include hyphen(-)")
      end
      it '郵便番号にハイフンがない場合保存できない' do
        @destination_purchase_management.post_code = '1234567'
        @destination_purchase_management.valid?
        expect(@destination_purchase_management.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
      end
      it '都道府県が空欄の場合保存できない' do
        @destination_purchase_management.prefecture_id = ''
        @destination_purchase_management.valid?
        expect(@destination_purchase_management.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '市区町村が空欄の場合保存できない' do
        @destination_purchase_management.city = ''
        @destination_purchase_management.valid?
        expect(@destination_purchase_management.errors.full_messages).to include("City can't be blank", "City is invalid. Input full-width characters.")
      end
      it '番地が空欄の場合保存できない' do
        @destination_purchase_management.address = ''
        @destination_purchase_management.valid?
        expect(@destination_purchase_management.errors.full_messages).to include("Address can't be blank")
      end
      it '電話番号がからの場合保存できない' do
        @destination_purchase_management.phone_number = ''
        @destination_purchase_management.valid?
        expect(@destination_purchase_management.errors.full_messages).to include("Phone number can't be blank", "Phone number is invalid.")
      end
      it '電話番号が11桁以上の場合保存できない' do
        @destination_purchase_management.phone_number = '012077726567'
        @destination_purchase_management.valid?
        expect(@destination_purchase_management.errors.full_messages).to include("Phone number is invalid.")
      end
    end
  end
end
