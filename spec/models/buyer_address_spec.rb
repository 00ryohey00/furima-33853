require 'rails_helper'

RSpec.describe BuyerAddress, type: :model do
  describe '購入情報の保存' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @buyer_address = FactoryBot.build(:buyer_address, user_id: user.id, item_id: item.id)
      sleep(1)
    end

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@buyer_address).to be_valid
      end
      it 'buildingは空でも保存できること' do
        @buyer_address.building = ''
        expect(@buyer_address).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'postal_codeが空だと保存できないこと' do
        @buyer_address.postal_code = ''
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @buyer_address.postal_code = '1234567'
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include('Postal code is invalid')
      end
      it 'prefectureが空では保存できないこと' do
        @buyer_address.prefecture_id = ''
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'prefectureに1を選択すると保存できないこと' do
        @buyer_address.prefecture_id = 1
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include('Prefecture must be other than 1')
      end
      it 'cityは空だと保存できないこと' do
        @buyer_address.city = ''
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("City can't be blank")
      end
      it 'addressesは空だと保存できないこと' do
        @buyer_address.addresses = ''
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("Addresses can't be blank")
      end
      it 'tokenが空だと保存できないこと' do
        @buyer_address.token = nil
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("Token can't be blank")
      end
      it 'phone_numberが全角数字だと保存できないこと' do
        @buyer_address.phone_number = '２０００'
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include('Phone number is invalid')
      end
      it 'phone_numberが半角数字のみでない場合は保存できないこと' do
        @buyer_address.phone_number = '33２０００33'
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include('Phone number is invalid')
      end
      it 'phone_numberが12文字以上では保存できないこと' do
        @buyer_address.phone_number = '999_999_999_999'
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include('Phone number is too long (maximum is 11 characters)')
      end
      it 'itemが紐付いていないと保存できないこと' do
        @buyer_address.item_id = nil
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("Item can't be blank")
      end
      it 'userが紐付いていないと保存できないこと' do
        @buyer_address.user_id = nil
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("User can't be blank")
      end
    end
  end
end
