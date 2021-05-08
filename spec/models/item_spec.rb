require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    context '商品出品できるとき' do
      it 'image、title、explain、category、status、financial、
         prefecture、day、priceが存在すれば登録できる' do
        expect(@item).to be_valid
      end
      it 'priceが¥300~¥9,999,999の間であれば登録できる' do
        @item.price = '3333333'
        expect(@item).to be_valid
      end
      it 'priceが半角数字であれば登録できる' do
        @item.price = '333333'
        expect(@item).to be_valid
      end
    end

    context '商品出品できないとき' do
      it 'priceが¥300より小さい場合登録できない' do
        @item.price = 200
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')
      end
      it 'priceが¥9,999,999より大きい場合登録できない' do
        @item.price = 99_999_999
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be less than or equal to 9999999')
      end
      it 'priceが半角数字でない場合登録できない' do
        @item.price = '３３３３３'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end
      it 'imageが空では登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Image can't be blank"
      end
      it 'titleが空では登録できない' do
        @item.title = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Title can't be blank"
      end
      it 'explainが空では登録できない' do
        @item.explain = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Explain can't be blank"
      end
      it 'categoryが空では登録できない' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Category can't be blank"
      end
      it 'statusが空では登録できない' do
        @item.status_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Status can't be blank"
      end
      it 'financialが空では登録できない' do
        @item.financial_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Financial can't be blank"
      end
      it 'prefectureが空では登録できない' do
        @item.prefecture_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Prefecture can't be blank"
      end
      it 'dayが空では登録できない' do
        @item.day_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Day can't be blank"
      end
      it 'priceが空では登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Price can't be blank"
      end
    end
  end
end
