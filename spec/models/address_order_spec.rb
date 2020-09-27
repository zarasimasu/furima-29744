require 'rails_helper'

RSpec.describe AddressOrder, type: :model do
  before do
    @address_order = FactoryBot.build(:address_order)
  end

  describe '購入者情報の保存' do
    context '購入者情報入力がうまくいくとき' do
      it '建物名が入力されていなくても保存できる' do
        @address_order.building = ""
        expect(@address_order).to be_valid
      end
      it 'すべての項目が入力されていれば保存できる' do
        expect(@address_order).to be_valid
      end
    end

    context '購入者情報入力がうまくいかないとき' do
      it '郵便番号が空だと保存できない' do
        @address_order.postal_code = nil
        @address_order.valid?
        expect(@address_order.errors.full_messages).to include("Postal code can't be blank", "Postal code is invalid")
      end
      it '郵便番号にハイフンがなければ保存できない' do
        @address_order.postal_code = '1234567'
        @address_order.valid?
        expect(@address_order.errors.full_messages).to include("Postal code is invalid")
      end
      it '郵便番号が半角数字でないと保存できない' do
        @address_order.postal_code = '１２３-４５６７'
        @address_order.valid?
        expect(@address_order.errors.full_messages).to include("Postal code is invalid")
      end
      it '都道府県の入力が--だと保存できない' do
        @address_order.prefecture_id = 1
        @address_order.valid?
        expect(@address_order.errors.full_messages).to include("Prefecture must be other than 1")
      end
      it '市区町村の入力が空だと保存できない' do
        @address_order.municipality = nil
        @address_order.valid?
        expect(@address_order.errors.full_messages).to include("Municipality can't be blank")
      end
      it '電話番号が空だと保存できない' do
        @address_order.tel = nil
        @address_order.valid?
        expect(@address_order.errors.full_messages).to include("Tel can't be blank", "Tel is invalid")
      end
      it '電話番号が半角数字でないと保存できない' do
        @address_order.tel = '０８０１２３４５６７８'
        @address_order.valid?
        expect(@address_order.errors.full_messages).to include("Tel is invalid")
      end
      it '電話番号が11桁以上だと保存できない' do
        @address_order.tel = '080123456789'
        @address_order.valid?
        expect(@address_order.errors.full_messages).to include("Tel is invalid")
      end
      it 'tokenが空だと保存できない' do
        @address_order.token = nil
        @address_order.valid?
        expect(@address_order.errord.fullmessages).to include("Token can't be blank")
      end
    end
  end
end
