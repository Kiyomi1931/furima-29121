require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  it "ログインしていない場合は出品ページへアクセスできないこと" do

  end

  it "ログインしている場合は出品ページへアクセスできること" do

  end

  it "記入欄全てが回答されている場合保存ができること" do

  end

  it "画像が空では登録できないこと" do

  end

  it "商品名が空では登録できないこと" do

  end

  it "商品の説明が空では登録できないこと" do

  end

  it "カテゴリーの情報が空では登録できないこと" do

  end

  it "商品の状態の情報が空では登録できないこと" do

  end

  it "配送料の情報が空では登録できないこと" do

  end

  it "発送元の情報が空では登録できないこと" do

  end

  it "発送までの日数の情報が空では登録できないこと" do

  end

  it "価格が空では登録できないこと" do

  end

  it "価格が全角では登録できないこと" do

  end

  it "価格が３００円未満では登録できないこと" do

  end

  it "価格が1000万円以上では登録できないこと" do

  end
  
end
