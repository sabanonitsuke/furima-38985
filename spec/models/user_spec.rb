require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  describe 'ユーザー新規登録' do
    context '新規登録できる場合' do
      it 'email,password,password_confirmation,nickname,last_name,first_name,last_name_kana,first_name_kana,birth_dateを全て正しく入力すれば登録できる' do
        expect(@user).to be_valid
      end
    end
    context '新規登録できない場合' do
      it 'emailが空だと登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Eメールを入力してください")
      end
      it 'emailは@を含まないと登録できない' do
        @user.email = 'qwertyuiop'
        @user.valid?
        expect(@user.errors.full_messages).to include('Eメールは不正な値です')
      end
      it 'emailがすでに登録されているデータと重複していると登録できない' do
        @user.email = 'qwertyuiop'
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        @user.valid?
        expect(@user.errors.full_messages).to include('Eメールは不正な値です')
      end
      it 'passwordが空だと登録できない' do
        @user.password = ''
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードを入力してください")
      end
      it '英字のみのpasswordでは登録できない' do
        @user.password = 'salmon'
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは半角英数字で入力してください')
      end
      it '数字のみのpasswordでは登録できない' do
        @user.password = '123456'
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは半角英数字で入力してください')
      end
      it '全角文字を含むpasswordでは登録できない' do
        @user.password = 'サーモンイクラマグロ'
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは半角英数字で入力してください')
      end
      it 'passwordが5文字以下では登録できない' do
        @user.password = 'AKB48'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは6文字以上で入力してください')
      end
      it 'passwordが129文字以上では登録できない' do
        @user.password = Faker::Lorem.characters(number: 129, min_alpha: 1, min_numeric: 1)
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは128文字以内で入力してください')
      end
      it 'passwordとpassword_confirmationが一致していないと登録できない' do
        @user.password = '123456'
        @user.password_confirmation = '1234567'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
      end
      it 'nicknameが空だと登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("ニックネームを入力してください")
      end
      it 'last_nameが空だと登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("苗字を入力してください")
      end
      it 'last_nameが全角（漢字・ひらがな・カタカナ）でなければ登録できない' do
        @user.last_name = 'salmon'
        @user.valid?
        expect(@user.errors.full_messages).to include('苗字は全角文字で入力してください')
      end
      it 'first_nameが空だと登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("名前を入力してください")
      end
      it 'first_nameが全角（漢字・ひらがな・カタカナ）でなければ登録できない' do
        @user.first_name = 'salmon'
        @user.valid?
        expect(@user.errors.full_messages).to include('名前は全角文字で入力してください')
      end
      it 'last_name_kanaが空だと登録できない' do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("苗字(カナ)を入力してください")
      end
      it 'last_name_kanaが全角（カタカナ）でなければ登録できない' do
        @user.last_name_kana = 'さーもん'
        @user.valid?
        expect(@user.errors.full_messages).to include('苗字(カナ)は全角カタカナで入力してください')
      end
      it 'first_name_kanaが空だと登録できない' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("名前(カナ)を入力してください")
      end
      it 'first_name_kanaが全角（カタカナ）でなければ登録できない' do
        @user.first_name_kana = 'さーもん'
        @user.valid?
        expect(@user.errors.full_messages).to include('名前(カナ)は全角カタカナで入力してください')
      end
      it 'birth_dateが空だと登録できない' do
        @user.birth_date = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("生年月日を入力してください")
      end
    end
  end
end
