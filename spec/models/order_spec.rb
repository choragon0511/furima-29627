require 'rails_helper'

RSpec.describe Order, type: :model do
  before do
    @order = FactoryBot.build(:order)
  end

  describe '商品購入' do
    context '商品購入できる場合' do
      it 'すべての値が正しく入力されていれば購入できること' do
        expect(@order).to be_valid
      end
      it 'buildingがなくても購入できる' do
        @order.building = ''
        expect(@order).to be_valid
      end
    end
    context '商品購入できない場合' do
      it 'tokenがないと購入できない' do
        @order.token = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Token can't be blank")
      end
      it 'user_idがないと購入できない' do
        @order.user_id = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("User can't be blank")
      end
      it 'item_idがないと購入できない' do
        @order.item_id = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Item can't be blank")
      end
      it 'postal_codeがないと購入できない' do
        @order.postal_code = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_codeに-が必要である' do
        @order.postal_code = '1234567'
        @order.valid?
        expect(@order.errors.full_messages).to include('Postal code is invalid. Enter it as follows (e.g. 123-4567)')
      end
      it 'prefecture_idがないと購入できない' do
        @order.prefecture_id = 1
        @order.valid?
        expect(@order.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'municipalityがないと購入できない' do
        @order.municipality = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Municipality can't be blank")
      end
      it 'addressがないと購入できない' do
        @order.address = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Address can't be blank")
      end
      it 'phone_numberがないと購入できない' do
        @order.phone_number = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberは数字のみ使える' do
        @order.phone_number = 'aaabbbbcccc'
        @order.valid?
        expect(@order.errors.full_messages).to include('Phone number is invalid. Input only number')
      end
      it 'phone_numberは10桁以上の必要がある' do
        @order.phone_number = '090111222'
        @order.valid?
        expect(@order.errors.full_messages).to include('Phone number is too short')
      end
      it 'phone_numberは11桁以下の必要がある' do
        @order.phone_number = '090111122223'
        @order.valid?
        expect(@order.errors.full_messages).to include('Phone number is too long')
      end
    end
  end
end
