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

    end

    it "emailが空では登録できないこと" do

    end

    it "passwordが空では登録できないこと" do

    end

    it "passwordが存在してもpassword_confirmationが空では登録できないこと" do

    end

    it "first_nameが空では登録できない" do

    end

    it "last_nameが空では登録できない" do

    end

    it "first_name_kanaが空では登録できない" do

    end

    it "last_name_kanaが空では登録できない" do

    end

    it "birthdayが空では登録できない" do

    end
  end
end
