require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it 'nickname,email、password,password_confirmation,
          first_name,first_name_kana,last_name,last_name_kana,
          birthdayが存在すれば登録できる' do
        expect(@user).to be_valid
      end
    end
    context '新規登録ができないとき' do
      it 'ニックネームが必須であること' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Nickname can't be blank"
      end
      it 'メールアドレスが必須であること' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Email can't be blank"
      end
      it 'メールアドレスが一意性であること' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include 'Email has already been taken'
      end
      it 'メールアドレスは@を含む必要があること' do
        @user.email = @user.email.delete('@')
        @user.valid?
        expect(@user.errors.full_messages).to include 'Email is invalid'
      end
      it 'パスワードが必須であること' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Password can't be blank"
      end
      it 'パスワードは6文字以上であること' do
        @user.password = '1q2w3'
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include 'Password is too short (minimum is 6 characters)'
      end
      it 'パスワードは半角英数字混合であること、数字のみでは登録できない' do
        @user.password = '123456'
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include 'Password is invalid. Include both letters and numbers'
      end
      it 'パスワードは半角英数字混合であること、英字のみでは登録できない' do
        @user.password = 'abcdef'
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include 'Password is invalid. Include both letters and numbers'
      end
      it 'パスワードは半角英数字混合であること、全角文字を含むと登録できない' do
        @user.password = 'あ1q2w3e'
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include 'Password is invalid. Include both letters and numbers'
      end
      it 'パスワードは確認用を含めて2回入力すること' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
      end
      it 'ユーザー本名、名字が必須であること' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name can't be blank"
      end
      it 'ユーザー本名、名前が必須であること' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "First name can't be blank"
      end
      it 'ユーザー本名、名字は全角（漢字・ひらがな・カタカナ）で入力させること' do
        @user.last_name = '1q'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Last name is invalid. Input full-width characters'
      end
      it 'ユーザー本名、名前は全角（漢字・ひらがな・カタカナ）で入力させること' do
        @user.first_name = '1q'
        @user.valid?
        expect(@user.errors.full_messages).to include 'First name is invalid. Input full-width characters'
      end
      it 'ユーザー本名のフリガナ、名字が必須であること' do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name kana can't be blank"
      end
      it 'ユーザー本名のフリガナ、名前が必須であること' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "First name kana can't be blank"
      end
      it 'ユーザー本名のフリガナ、名字は全角（カタカナ）で入力させること' do
        @user.last_name_kana = '1q'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Last name kana is invalid. Input full-width katakana characters'
      end
      it 'ユーザー本名のフリガナ、名前は全角（カタカナ）で入力させること' do
        @user.first_name_kana = '1q'
        @user.valid?
        expect(@user.errors.full_messages).to include 'First name kana is invalid. Input full-width katakana characters'
      end
      it '生年月日が必須であること' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Birthday can't be blank"
      end
    end
  end
end
