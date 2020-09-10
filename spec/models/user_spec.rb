require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.build(:user)
    end

    it "必須項目が全てあれば登録できること" do
      expect(@user).to be_valid
    end

    it "nicknameが空では登録できないこと" do
      @user.nickname = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Nicknameを入力してください")
    end

    it "emailが空では登録できないこと" do
      @user.email = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Emailを入力してください")
    end

    it "重複したemailが存在する場合登録できないこと" do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Emailはすでに存在します")
    end

    it "passwordが空では登録できないこと" do
      @user.password = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Passwordを入力してください")
    end

    it "passwordが存在してもpassword_confirmationが空では登録できないこと" do
      @user.password_confirmation = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmationとPasswordの入力が一致しません")
    end

    it "passwordが6文字以上であれば登録できること" do
      @user.password = "123abc"
      @user.password_confirmation = "123abc"
      expect(@user).to be_valid
    end

    it "passwordが5文字以下であれば登録できないこと" do
      @user.password = "123ab"
      @user.password_confirmation = "123ab"
      @user.valid?
      expect(@user.errors.full_messages).to include("Passwordは6文字以上で入力してください")
    end

    it "passwordが半角数字のみなら登録できないこと" do
      @user.password = "123456"
      @user.password_confirmation = "123456"
      @user.valid?
      expect(@user.errors.full_messages).to include("Passwordには英字と数字の両方を含めて設定してください")
    end

    it "passwordが半角英字のみなら登録できないこと" do
      @user.password = "abcdefg"
      @user.password_confirmation = "abcdefg"
      @user.valid?
      expect(@user.errors.full_messages).to include("Passwordには英字と数字の両方を含めて設定してください")
    end

    it "first_nameが空では登録できない" do
      @user.first_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("First nameを入力してください")
    end

    it "last_nameが空では登録できない" do
      @user.last_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Last nameを入力してください")
    end

    it "first_name_kanaが空では登録できない" do
      @user.first_name_kana = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kanaを入力してください")
    end

    it "last_name_kanaが空では登録できない" do
      @user.last_name_kana = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kanaを入力してください")
    end

    it "birthdayが空では登録できない" do
      @user.birthday = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthdayを入力してください")
    end
  end
end
