require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー情報' do
    before do
      @user = FactoryBot.build(:user)
    end

    it "全ての項目を入力すれば登録できること" do
      expect(@user).to be_valid
    end

    it "ニックネームが空だと登録できないこと" do
      @user.nickname=""
      @user.valid?
      expect(@user.errors.full_messages).to include "Nickname can't be blank"
    end

    it "メールアドレスが空だと登録できないこと" do
      @user.email=""
      @user.valid?
      expect(@user.errors.full_messages).to include "Email can't be blank"
    end

    it "重複したメールアドレスがあると登録できないこと" do
      @user.save
      user2 = FactoryBot.build(:user, email: @user.email)
      user2.valid?
      expect(user2.errors.full_messages).to include "Email has already been taken"
    end

    it "メールアドレスに@を含まないと登録できないこと" do
      @user.email="testexample"
      @user.valid?
      expect(@user.errors.full_messages).to include "Email is invalid"
    end

    it "パスワードが空だと登録できないこと" do
      @user.password=""
      @user.password_confirmation=""
      @user.valid?
      expect(@user.errors.full_messages).to include "Password can't be blank",
      "Password is invalid"
    end

    it "パスワードは５文字以下では登録できないこと" do
      @user.password="test1"
      @user.password_confirmation="test1"
      @user.valid?
      expect(@user.errors.full_messages).to include "Password is too short (minimum is 6 characters)", "Password is invalid"
    end

    it "パスワードは半角英字だけでは登録できないこと" do
      @user.password="testte"
      @user.password_confirmation="testte"
      @user.valid?
      expect(@user.errors.full_messages).to include "Password is invalid"
    end

    it "パスワードは数字だけでは登録できないこと" do
      @user.password="123456"
      @user.password_confirmation="123456"
      @user.valid?
      expect(@user.errors.full_messages).to include "Password is invalid"
    end

    it "パスワードの確認用を入力しないと登録できないこと" do
      @user.password_confirmation=""
      @user.valid?
      expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
    end
  end

  describe '本人情報確認' do
    before do
      @user = FactoryBot.build(:user)
    end

    it "ユーザー本名が、名字が空欄だと登録できないこと" do
      @user.last_name=""
      @user.valid?
      expect(@user.errors.full_messages).to include "Last name can't be blank", "Last name is invalid"
    end

    it "ユーザー本名が、名前が空欄では登録できないこと" do
      @user.first_name=""
      @user.valid?
      expect(@user.errors.full_messages).to include "First name can't be blank", "First name is invalid"
    end

    it "ユーザーの名字が半角では登録できないこと" do
      @user.last_name="abcdef"
      @user.valid?
      expect(@user.errors.full_messages).to include "Last name is invalid"
    end

    it "ユーザーの名前が半角では登録できないこと" do
      @user.first_name="abcdef"
      @user.valid?
      expect(@user.errors.full_messages).to include "First name is invalid"
    end

    it "ユーザー名字のフリガナが空欄では登録できないこと" do
      @user.last_name_kana=""
      @user.valid?
      expect(@user.errors.full_messages).to include "Last name kana can't be blank", "Last name kana is invalid"
    end

    it "ユーザー名前のフリガナが空欄では登録できないこと" do
      @user.first_name_kana=""
      @user.valid?
      expect(@user.errors.full_messages).to include "First name kana can't be blank", "First name kana is invalid"
    end

    it "ユーザー名字のフリガナは全角ひらがなでは登録できないこと" do
      @user.last_name_kana="たなか"
      @user.valid?
      expect(@user.errors.full_messages).to include "Last name kana is invalid"
    end

    it "ユーザー名字のフリガナは全角漢字では登録できないこと" do
      @user.last_name_kana="田中"
      @user.valid?
      expect(@user.errors.full_messages).to include "Last name kana is invalid"
    end

    it "ユーザー名字のフリガナは半角英数字では登録できないこと" do
      @user.last_name_kana="tanaka"
      @user.valid?
      expect(@user.errors.full_messages).to include "Last name kana is invalid"
    end

    it "ユーザー名前のフリガナは全角ひらがなでは登録できないこと" do
      @user.first_name_kana="たろう"
      @user.valid?
      expect(@user.errors.full_messages).to include "First name kana is invalid"
    end

    it "ユーザー名字のフリガナは全角漢字では登録できないこと" do
      @user.first_name_kana="太郎"
      @user.valid?
      expect(@user.errors.full_messages).to include "First name kana is invalid"
    end

    it "ユーザー名字のフリガナは半角英数字では登録できないこと" do
      @user.first_name_kana="tarou"
      @user.valid?
      expect(@user.errors.full_messages).to include "First name kana is invalid"
    end

    it "生年月日が空欄では登録できないこと" do
      @user.user_birth_date=""
      @user.valid?
      expect(@user.errors.full_messages).to include "User birth date can't be blank"
    end
  end
end
