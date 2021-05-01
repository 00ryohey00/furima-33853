require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it 'nickname、email、passwordとpassword_confirmation、firstname、lastname、
         firstname_kana、lastname_kanaが存在すれば登録できる' do
        expect(@user).to be_valid
      end
      it 'passwordが6文字以上であれば登録できる' do
        @user.password = 'aaaaaa33'
        @user.password_confirmation = 'aaaaaa33'
        expect(@user).to be_valid
      end
      it 'passwordが半角英数字混同であれば登録できる' do
        @user.password = 'aaa333'
        @user.password_confirmation = @user.password
        expect(@user).to be_valid
      end
      it 'passwordとpassword_confirmationが一致すれば登録できる' do
        @user.password = 'aaa333'
        @user.password_confirmation = @user.password
        expect(@user).to be_valid
      end
    end
    context '新規登録できないとき' do
      it '重複したemailが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'emailに＠が含まれていないと登録出来ない' do
        @user.email = 'aaaaaaa.com'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it 'passwordが5文字以下では登録できない' do
        @user.password = 'aaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'passwordが半角数字のみの場合は登録できない' do
        @user.password = '1111111'
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end
      it 'passwordが半角英字のみの場合は登録できない' do
        @user.password = 'aaaaaaaa'
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end
      it 'passwordが全角の場合は登録できない' do
        @user.password = 'ａａａ１１１１'
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end
      it 'passwordとpassword_confirmationが一致しなければ登録できない' do
        @user.password = 'aaa333'
        @user.password_confirmation = 'bbb444'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Nickname can't be blank"
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Email can't be blank"
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Password can't be blank"
      end
      it 'passwordが存在してもpassword_confirmationが空では登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
      end
      it 'firstnameが空では登録できない' do
        @user.firstname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Firstname can't be blank"
      end
      it 'firstnameは全角（漢字・ひらがな・カタカナ）でなければ登録できない' do
        @user.firstname = 'ｱｱｱｲｲｲ'
        @user.valid?
        expect(@user.errors.full_messages).to include "Firstname is invalid"
      end
      it 'lastnameが空では登録できない' do
        @user.lastname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Lastname can't be blank"
      end
      it 'lastnameは全角（漢字・ひらがな・カタカナ）でなければ登録できない' do
        @user.lastname = 'ｱｱｱｲｲｲ'
        @user.valid?
        expect(@user.errors.full_messages).to include "Lastname is invalid"
      end
      it 'firstname_kanaが空では登録できない' do
        @user.firstname_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Firstname kana can't be blank"
      end
      it 'firstname_kanaは全角（カタカナ）でなければ登録できない' do
        @user.firstname_kana = 'ｱｱｱあああ'
        @user.valid?
        expect(@user.errors.full_messages).to include "Firstname kana is invalid"
      end
      it 'lastname_kanaが空では登録できない' do
        @user.lastname_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Lastname kana can't be blank"
      end
      it 'lastname_kanaは全角（カタカナ）でなければ登録できない' do
        @user.lastname_kana = 'ｱｱｱあああ'
        @user.valid?
        expect(@user.errors.full_messages).to include "Lastname kana is invalid"
      end
    end
  end
end