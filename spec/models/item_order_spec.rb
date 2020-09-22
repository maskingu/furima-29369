require 'rails_helper'

RSpec.describe ItemOrder, type: :model do
  describe '商品購入情報の保存' do
    before do
      @item_order = FactoryBot.build(:item_order)
    end

    it 'すべての値が正しく入力されていれば保存できること' do
      expect(@item_order).to be_valid
    end

    it 'tokenが空だと保存できない' do
      @item_order.token = nil
      @item_order.valid?
      expect(@item_order.errors.full_messages).to include('Tokenを入力してください')
    end

    it 'postal_codeが空だと保存できない' do
      @item_order.postal_code = nil
      @item_order.valid?
      expect(@item_order.errors.full_messages).to include('Postal codeを入力してください')
    end

    it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
      @item_order.postal_code = 1234567
      @item_order.valid?
      expect(@item_order.errors.full_messages).to include('Postal codeハイフン(-)を使用してください')
    end

    it 'prefectureを選択していないと保存できないこと' do
      @item_order.prefecture = nil
      @item_order.valid?
      expect(@item_order.errors.full_messages).to include('Prefectureを入力してください')
    end

    it 'cityが空だと保存できないこと' do
      @item_order.city = ""
      @item_order.valid?
      expect(@item_order.errors.full_messages).to include('Cityを入力してください')
    end

    it 'house_numberが空だと保存できないこと' do
      @item_order.house_number = ""
      @item_order.valid?
      expect(@item_order.errors.full_messages).to include('House numberを入力してください')
    end

    it 'building_nameは空でも保存できること' do
      @item_order.building_name = ""
      expect(@item_order).to be_valid
    end

    it 'phone_numberが空だと保存できないこと' do
      @item_order.phone_number = ""
      @item_order.valid?
      expect(@item_order.errors.full_messages).to include('Phone numberを入力してください')
    end

    it 'phone_numberがハイフン無しで11桁以内でないと保存できないこと' do
      @item_order.phone_number = '1234-56789111'
      @item_order.valid?
      expect(@item_order.errors.full_messages).to include('Phone number11桁以内の数字を入力してください')
    end

  end
end
