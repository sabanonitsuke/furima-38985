require 'rails_helper'

RSpec.describe PurchaseDestination, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @purchase_destination = FactoryBot.build(:purchase_destination, user_id: user.id, item_id: item.id)
  end

  describe '商品の購入' do
    context '購入できる場合' do
      it '全ての値が正しく入力されていると購入できる' do
        expect(@purchase_destination).to be_valid
      end
      it 'building_nameが空でも購入できる' do
        @purchase_destination.building_name = ''
        expect(@purchase_destination).to be_valid
      end
    end
    context '購入できない場合' do
      it 'userが紐づいていないと購入できない' do
        @purchase_destination.user_id = nil
        @purchase_destination.valid?
        expect(@purchase_destination.errors.full_messages).to include("Userを入力してください")
      end
      it 'itemが紐づいていないと購入できない' do
        @purchase_destination.item_id = nil
        @purchase_destination.valid?
        expect(@purchase_destination.errors.full_messages).to include("Itemを入力してください")
      end
      it 'tokenが空だと購入できない' do
        @purchase_destination.token = nil
        @purchase_destination.valid?
        expect(@purchase_destination.errors.full_messages).to include("クレジットカード情報を入力してください")
      end
      it 'postal_codeが空だと購入できない' do
        @purchase_destination.postal_code = ''
        @purchase_destination.valid?
        expect(@purchase_destination.errors.full_messages).to include("郵便番号を入力してください")
      end
      it 'postal_codeが半角のハイフンを含めた正しい形式でなければ購入できない' do
        @purchase_destination.postal_code = '1234567'
        @purchase_destination.valid?
        expect(@purchase_destination.errors.full_messages).to include('郵便番号は正しい形式で入力してください(例:123-4567)')
      end
      it 'prefecture_idが選択されていないと購入できない' do
        @purchase_destination.prefecture_id = 1
        @purchase_destination.valid?
        expect(@purchase_destination.errors.full_messages).to include("都道府県を選択してください")
      end
      it 'cityが空だと購入できない' do
        @purchase_destination.city = ''
        @purchase_destination.valid?
        expect(@purchase_destination.errors.full_messages).to include("市区町村を入力してください")
      end
      it 'house_numberが空だと購入できない' do
        @purchase_destination.house_number = ''
        @purchase_destination.valid?
        expect(@purchase_destination.errors.full_messages).to include("番地を入力してください")
      end
      it 'phone_numberが空だと購入できない' do
        @purchase_destination.phone_number = ''
        @purchase_destination.valid?
        expect(@purchase_destination.errors.full_messages).to include("電話番号を入力してください")
      end
      it 'phone_numberが9桁以下だと購入できない' do
        @purchase_destination.phone_number = '123456789'
        @purchase_destination.valid?
        expect(@purchase_destination.errors.full_messages).to include('電話番号が短すぎます')
      end
      it 'phone_numberが12桁以上では登録できない' do
        @purchase_destination.phone_number = '123456789012'
        @purchase_destination.valid?
        expect(@purchase_destination.errors.full_messages).to include('電話番号が短すぎます')
      end
      it 'phone_numberが全角数字だと登録できない' do
        @purchase_destination.phone_number = '０９０１２３４５６７８'
        @purchase_destination.valid?
        expect(@purchase_destination.errors.full_messages).to include('電話番号は半角数字のみで入力してください')
      end
      it 'phone_numberにハイフンが入っていると登録できない' do
        @purchase_destination.phone_number = '090-1234-5678'
        @purchase_destination.valid?
        expect(@purchase_destination.errors.full_messages).to include('電話番号は半角数字のみで入力してください')
      end
    end
  end
end
