require 'rails_helper'

RSpec.describe OrderForm, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item)
    @order_form = FactoryBot.build(:order_form)
    @order_form.user_id = @user.id
    @order_form.item_id=@item.id
    sleep(0.5)
  end

  describe '商品購入機能' do
    context '商品購入ができる時' do
      it "購入フォームに全て記述すれば購入できる。" do
        expect(@order_form).to be_valid
      end
      it "建物名が抜けていても登録できること" do
        @order_form.building=nil
        expect(@order_form).to be_valid
      end
    end
    context '商品購入ができない時' do
      it "tokenが空では登録できないこと" do
        @order_form.token = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Token can't be blank")
      end
      it "郵便番号が空欄では登録できないこと" do
        @order_form.postal_code=nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Postal code can't be blank", "Postal code is invalid")
      end
      it "都道府県が空欄では登録できないこと" do
        @order_form.prefecture_id=0
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Prefecture must be other than 0")
      end
      it "市区町村が空欄では登録できないこと" do
        @order_form.city=nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("City can't be blank")
      end
      it "番地が空欄では登録できないこと" do
        @order_form.addresses=nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Addresses can't be blank")
      end
      it "電話番号が空欄では登録できないこと" do
        @order_form.phone_number=nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Phone number can't be blank", "Phone number is invalid")
      end
      it "郵便番号はハイフンがないと登録できないこと" do
        @order_form.postal_code="2222222"
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Postal code is invalid")
      end
      it "電話番号はハイフンがあると登録できないこと" do
        @order_form.phone_number="0120-000"
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Phone number is invalid")
      end
      it "電話番号は１２桁以上だと登録できないこと" do
        @order_form.phone_number="012345678901"
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Phone number is too long (maximum is 11 characters)")
      end
      it "英数混合では登録できないこと" do
        @order_form.phone_number="abc0120"
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Phone number is invalid")
      end
      it "user_idが空では登録できないこと" do
        @order_form.user_id=nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("User can't be blank")
      end
      it "item_idが空では登録できないこと" do
        @order_form.item_id=nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end

