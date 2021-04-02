require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
   context '新規登録できるとき' do
    it '全ての項目(nickname, email, password, password_confirmation, family_name, first_name, family_name_kana, first_name_kana, birth_day)が存在すれば登録できる' do
      expect(@user).to be_valid
    end
    it 'passwordとpassword_confirmationが6文字以上であれば登録できる' do
      @user.password = 'a23456'
      @user.password_confirmation = 'a23456'
      expect(@user).to be_valid
    end
    it 'emailは@があれば登録できる' do
      @user.email = 'test1@gmail.com'
      expect(@user).to be_valid
    end
   context '新規登録できないとき'
    it 'nicknameが空欄では登録できない' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end
    it 'emailが空欄では登録できない' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it "emailに@がないと登録できない" do
      @user.email = '@'
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
    end
    it 'passwordが空欄では登録できない' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it 'password:半角英数混合(半角英語のみ)' do
      @user.password = 'aaaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it 'passwordは英語のみでは登録できないこと' do
      @user.password = 'AAAAAA'
      @user.password_confirmation = 'AAAAAA'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid")
    end
    it 'passwordは数字のみでは登録できないこと' do
      @user.password = '111111'
      @user.password_confirmation = '111111'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid")
    end
    it 'passwordは全角では登録できないこと' do
      @user.password = 'あいうえお'
      @user.password_confirmation = 'あいうえお'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid")
    end
    it 'passwordが存在してもpassword_confirmationが空では登録できない' do
      @user.password_confirmation = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it 'family_nameが空欄では登録できない' do
      @user.family_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name can't be blank")
    end
    it 'first_nameが空欄では登録できない' do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end
    

    it 'family_nameが漢字・平仮名・カタカナ以外では登録できないこと' do
      @user.family_name = 'akamatsu'
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name に全角文字を使用してください")
    end
    it 'first_nameが漢字・平仮名・カタカナ以外では登録できないこと' do
      @user.first_name = 'koutarou'
      @user.valid?
      expect(@user.errors.full_messages).to include("First name に全角文字を使用してください")
    end


    it 'family_name_kanaが空欄では登録できない' do
      @user.family_name_kana = ''
      @user.valid?
      
      expect(@user.errors.full_messages).to include("Family name kana can't be blank")
    end
    it 'first_name_kanaが空欄では登録できない' do
      @user.first_name_kana = ''
      @user.valid?

      expect(@user.errors.full_messages).to include("First name kana can't be blank")
    end
    it 'birth_dayが空欄では登録できない' do
      @user.birth_day = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Birth day can't be blank")
    end
    it '重複したemailが存在する場合登録できない' do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
    end
    it 'passwordが5文字以下では登録できない' do
      @user.password = '00000'
      @user.password_confirmation = '00000'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end
    it "family_name_kanaが半角文字だと登録できないこと" do
      @user.family_name_kana = "あかまつ"
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name kana 全角カタカナのみで入力して下さい")
    end
    it "first_name_kanaが半角文字だと登録できないこと" do
      @user.first_name_kana = "こうたろう"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana 全角カタカナのみで入力して下さい")
    end
   end
  end
end
