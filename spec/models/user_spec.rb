require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it "すべての項目が存在すれば登録できること" do
        expect(@user).to be_valid
      end
      it "passwordが6文字以上であれば登録できる" do
        @user.password = "123456"
        @user.password_confirmation = "123456"
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかなないとき' do
      it "nicknameが空だと登録できない" do
        @user.nickname = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it "emailが空では登録できない" do
        @user.email = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it "emailに@が含まれていないと登録できない" do
        @user.email = "123456"
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
      it "重複したemailが存在する場合登録できない" do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
      it "passwordが空では登録できない" do
        @user.password = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      # it "passwordは英字のみでは登録できない" do
        # @user.password = "aaaaaaa"
        # @user.password_confirmation = "aaaaaaa"
        # @user.valid?
        # binding.pry
      # end
      it "passwordが5文字以下であれば登録できない" do
        @user.password = "12345"
        @user.password_confirmation = "12345"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it "passwordが存在してもpassword_confirmationが空では登録できない" do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it "family_nameが空では登録できない" do
        @user.family_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name can't be blank", "Family name is invalid")
      end
      it "first_nameが空では登録できない" do
        @user.first_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank", "First name is invalid")
      end
      it "family_name_kanaが空では登録できない" do
        @user.family_name_kana = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name kana can't be blank", "Family name kana is invalid")
      end
      it "first_name_kanaが空では登録できない" do
        @user.first_name_kana = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank", "First name kana is invalid")
      end
      it "birthdayが空では登録できない" do
        @user.birthday = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end
