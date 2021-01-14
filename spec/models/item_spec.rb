require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  context '商品出品ができる時' do
    it "記入欄全てが回答されている場合保存ができること" do
      expect(@item).to be_valid
    end
  end

  context '商品出品ができない時' do
    it "画像が空では登録できないこと" do
      @item.image=nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end

    it "商品名が空では登録できないこと" do
      @item.name=""
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end

    it "商品の説明が空では登録できないこと" do
      @item.info=""
      @item.valid?
      expect(@item.errors.full_messages).to include("Info can't be blank")
    end

    it "カテゴリーの情報が空では登録できないこと" do
      @item.category_id=1
      @item.valid?
      expect(@item.errors.full_messages).to include("Category must be other than 1")
    end

    it "商品の状態の情報が空では登録できないこと" do
      @item.sales_status_id=1
      @item.valid?
      expect(@item.errors.full_messages).to include("Sales status must be other than 1")
    end

    it "配送料の情報が空では登録できないこと" do
      @item.shipping_fee_status_id=1
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping fee status must be other than 1")
    end

    it "発送元の情報が空では登録できないこと" do
      @item.prefecture_id=0
      @item.valid?
      expect(@item.errors.full_messages).to include("Prefecture must be other than 0")
    end

    it "発送までの日数の情報が空では登録できないこと" do
      @item.scheduled_delivery_id=1
      @item.valid?
      expect(@item.errors.full_messages).to include("Scheduled delivery must be other than 1")
    end

    it "価格が空では登録できないこと" do
      @item.price=""
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank", "Price is invalid", "Price is not a number")
    end

    it "価格が全角では登録できないこと" do
      @item.price="５００"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not a number")
    end

    it "価格が３００円未満では登録できないこと" do
      @item.price=250
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
    end

    it "価格が1000万円以上では登録できないこと" do
      @item.price=10000000
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
    end
  end
end
