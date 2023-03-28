require 'rails_helper'

RSpec.describe PurchaseDestination, type: :model do
  before do
    user = FactoryBot.build(:user)
    item = FactoryBot.build(:item)
    @donation_address = FactoryBot.build(:purchase_destination, user_id: user.id, item_id: item.id)
  end
  describe "商品の購入" do
    context "購入できる場合" do
      it "全ての値が正しく入力されていると購入できる" do
        
      end
      it "building_nameが空でも購入できる" do
        
      end
    end
    context "購入できない場合" do
      it "userが紐づいていないと購入できない" do
        
      end
      it "itemが紐づいていないと購入できない" do
        
      end
      it "tokenが空だと購入できない" do
        
      end
      it "postal_codeが空だと購入できない" do
        
      end
      it "postal_codeが半角のハイフンを含めた正しい形式でなければ購入できない" do
        
      end
      it "prefecture_idが選択されていないと購入できない" do
        
      end
      it "cityが空だと購入できない" do
        
      end
      it "house_numberが空だと購入できない" do
        
      end
      it "phone_numberが空だと購入できない" do
        
      end
      it "phone_numberが10文字未満だと登録できない" do
        
      end
      it "phone_numberが全角数字だと登録できない" do
        
      end
    end
  end

end
