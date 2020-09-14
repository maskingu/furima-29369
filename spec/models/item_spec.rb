require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
    before do
      @item = FactoryBot.build(:item)
    end

    it '必須項目が全てあれば登録できること' do
      expect(@item).to be_valid
    end

    it '画像が無いと保存できない' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include('Imageを入力してください')
    end

    it '商品名がないと保存できない' do
      @item.title = nil
      @item.valid?
      expect(@item.errors.full_messages).to include('Titleを入力してください')
    end

    it '商品説明がないと保存できない' do
      @item.text = nil
      @item.valid?
      expect(@item.errors.full_messages).to include('Textを入力してください')
    end

    it 'カテゴリー情報がないと保存できない' do
      @item.category = nil
      @item.valid?
      expect(@item.errors.full_messages).to include('Categoryを入力してください')
    end

    it '商品の状態の情報がないと保存できない' do
      @item.status = nil
      @item.valid?
      expect(@item.errors.full_messages).to include('Statusを入力してください')
    end

    it '配送料の負担についての情報がないと保存できない' do
      @item.shipping_charge = nil
      @item.valid?
      expect(@item.errors.full_messages).to include('Shipping chargeを入力してください')
    end

    it '発送元の地域についての情報がないと保存できない' do
      @item.shipping_region = nil
      @item.valid?
      expect(@item.errors.full_messages).to include('Shipping regionを入力してください')
    end

    it '発送までの日数についての情報がないと保存できない' do
      @item.shipping_date = nil
      @item.valid?
      expect(@item.errors.full_messages).to include('Shipping dateを入力してください')
    end

    it '販売価格が空だと表示できない' do
      @item.price = nil
      @item.valid?
      expect(@item.errors.full_messages).to include('Priceを入力してください')
    end

    it '販売価格が決められた範囲内でなければ保存できない' do
      @item.price = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Price指定の範囲内で入力してください')
    end

    it '販売価格が決められた範囲内であれば保存できる' do
      @item.price = 333
      expect(@item).to be_valid
    end

    it '販売価格が半角数字以外では保存できないこと' do
      @item.price = '３３３'
      @item.valid?
      expect(@item.errors.full_messages).to include('Price半角数字を使用してください')
    end

    it '販売価格が半角数字のみなら保存できる' do
      @item.price = 333
      expect(@item).to be_valid
    end

    it 'userが紐付いていないと保存できないこと' do
      @item.user = nil
      @item.valid?
      expect(@item.errors.full_messages).to include('Userを入力してください')
    end
  end
end
