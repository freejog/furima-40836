require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    context '商品の出品ができる場合' do
      it '正常に出品ができる' do
        expect(@item).to be_valid
      end
    end
    context '商品出品ができない場合' do
      it 'imageが空では保存できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'item_nameが空では保存できない' do
        @item.item_name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Item name can't be blank")
      end
      it 'item_nameが41文字以上では保存できない' do
        @item.item_name = Faker::Alphanumeric.alphanumeric(number: 41)
        @item.valid?
        expect(@item.errors.full_messages).to include('Item name is too long (maximum is 40 characters)')
      end
      it 'descriptionが空では保存できない' do
        @item.description = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end
      it 'descriptionが1001文字以上では保存できない' do
        @item.description = Faker::Alphanumeric.alphanumeric(number: 1001)
        @item.valid?
        expect(@item.errors.full_messages).to include('Description is too long (maximum is 1000 characters)')
      end
      it 'category_idが空では保存できない' do
        @item.category_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it 'item_state_idが空では保存できない' do
        @item.item_state_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Item state can't be blank")
      end
      it 'charge_idが空では保存できない' do
        @item.charge_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Charge can't be blank")
      end
      it 'prefecture_idが空では保存できない' do
        @item.prefecture_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'day_idが空では保存できない' do
        @item.day_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Day can't be blank")
      end
      it 'price_idが空では保存できない' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it 'price_idが整数でなければ保存できない' do
        @item.price = 300.5
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be an integer')
      end
      it 'price_idが300未満では保存できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')
      end
      it 'price_idが9,999,999より大きければ保存できない' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be less than or equal to 9999999')
      end
      it '半角数字以外の値（全角の値）が含まれている場合は保存できないこと' do
        @item.price = 'あ'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end
      it 'userが紐付いていないと保存できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
    end
  end
end
