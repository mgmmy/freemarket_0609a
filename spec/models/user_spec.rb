require 'rails_helper'
class UserTest < ActiveSupport::TestCase
  describe '#create' do
    # ニックネーム空欄の場合
    it "is invalid without a nickname" do
      user = User.new(nickname: "", email: "user@example.com", encrypted_password: "00000000", last_name: "Taro", first_name: "Yamada", last_name_kana: "Tarokana", first_name_kana: "Yamaddakana", birthday: "19900101", tel: "00012345678")
      user.valid?
      expect(user.errors[:nickname]).to include("can't be blank")
    end

    # メールアドレス空欄の場合
    it "is invalid without an email" do
      user = User.new(nickname: "User", email: "", encrypted_password: "00000000", last_name: "Taro", first_name: "Yamada", last_name_kana: "Tarokana", first_name_kana: "Yamaddakana", birthday: "19900101", tel: "00012345678")
      user.valid?
      expect(user.errors[:email]).to include("can't be blank")
    end

    # パスワード空欄の場合
    it "is invalid without an encrypted_password" do
      user = User.new(nickname: "User", email: "kkk@gmail.com", encrypted_password: "", last_name: "Taro", first_name: "Yamada", last_name_kana: "Tarokana", first_name_kana: "Yamaddakana", birthday: "19900101", tel: "00012345678")
      user.valid?
      expect(user.errors[:encrypted_password]).to include("can't be blank")
    end

    # 名空欄の場合
    it "is invalid without a nickname" do
      user = User.new(nickname: "User", email: "kkk@gmail.com", encrypted_password: "00000000", last_name: "", first_name: "Yamada", last_name_kana: "Tarokana", first_name_kana: "Yamaddakana", birthday: "19900101", tel: "00012345678")
      user.valid?
      expect(user.errors[:last_name]).to include("can't be blank")
    end

    # 姓空欄の場合
    it "is invalid without a first_name" do
      user = User.new(nickname: "User", email: "kkk@gmail.com", encrypted_password: "00000000", last_name: "Taro", first_name: "", last_name_kana: "Tarokana", first_name_kana: "Yamaddakana", birthday: "19900101", tel: "00012345678")
      user.valid?
      expect(user.errors[:first_name]).to include("can't be blank")
    end

    # 名（カナ）空欄の場合
    it "is invalid without a last_name_kana" do
      user = User.new(nickname: "User", email: "kkk@gmail.com", encrypted_password: "00000000", last_name: "Taro", first_name: "Yamada", last_name_kana: "", first_name_kana: "Yamaddakana", birthday: "19900101", tel: "00012345678")
      user.valid?
      expect(user.errors[:last_name_kana]).to include("can't be blank")
    end

    # 姓（カナ）空欄の場合
    it "is invalid without a first_name_kana" do
      user = User.new(nickname: "User", email: "kkk@gmail.com", encrypted_password: "00000000", last_name: "Taro", first_name: "Yamada", last_name_kana: "Tarokana", first_name_kana: "", birthday: "19900101", tel: "00012345678")
      user.valid?
      expect(user.errors[:first_name_kana]).to include("can't be blank")
    end

    # 生年月日空欄の場合
    it "is invalid without a birthday" do
      user = User.new(nickname: "User", email: "kkk@gmail.com", encrypted_password: "00000000", last_name: "Taro", first_name: "Yamada", last_name_kana: "Tarokana", first_name_kana: "Yamaddakana", birthday: "", tel: "00012345678")
      user.valid?
      expect(user.errors[:birthday]).to include("can't be blank")
    end

    # 電話番号空欄の場合
    it "is invalid without a tel" do
      user = User.new(nickname: "User", email: "kkk@gmail.com", encrypted_password: "00000000", last_name: "Taro", first_name: "Yamada", last_name_kana: "Tarokana", first_name_kana: "Yamaddakana", birthday: "19900101", tel: "")
      user.valid?
      expect(user.errors[:tel]).to include("can't be blank")
    end    

  end
end