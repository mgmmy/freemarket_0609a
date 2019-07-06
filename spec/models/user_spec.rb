require 'rails_helper'
class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(nickname: "User", email: "user@example.com", encrypted_password: "00000000", last_name: "Taro", first_name: "Yamada", last_name_kana: "Tarokana", first_name_kana: "Yamaddakana", birthday: "19900101", tel: "00012345678")
  end

  # 必要事項が入力されているか
  test "should be valid" do
    assert @user.valid?
  end

  test "name should be present" do
    @user.name = ""
    assert_not @user.valid?
  end

  test "email should be present" do
    @user.email = ""
    assert_not @user.valid?
  end

  test "encrypted_password should be present" do
    @user.encrypted_password = ""
    assert_not @user.valid?
  end

  test "last_name should be present" do
    @user.last_name = ""
    assert_not @user.valid?
  end

  test "first_name should be present" do
    @user.first_name = ""
    assert_not @user.valid?
  end

  test "last_name_kana should be present" do
    @user.last_name_kana = ""
    assert_not @user.valid?
  end

  test "first_name_kana should be present" do
    @user.first_name_kana = ""
    assert_not @user.valid?
  end

  test "birthday should be present" do
    @user.birthday = ""
    assert_not @user.valid?
  end

  test "tel should be present" do
    @user.tel = ""
    assert_not @user.valid?
  end
  

  # 名前が長すぎないか
  test "last_name should not be too lond" do
    @user.last_name = "a" * 21
    assert_not @user.valid?
  end

  test "first_name should not be too lond" do
    @user.first_name = "a" * 21
    assert_not @user.valid?
  end

  test "last_name_kana should not be too lond" do
    @user.last_name_kana = "a" * 21
    assert_not @user.valid?
  end

  test "name should not be too lond" do
    @user.first_name_kana = "a" * 21
    assert_not @user.valid?
  end


  # メールアドレスが有効か
  test "email should not be too long" do
    @user.email = "a" * 101 + "@example.com"
    assert_not @user.valid?
  end

  # 有効なメールフォーマットと無効なメールフォーマット
  test "email validation should accept valid addresses" do
    valid_addresses = %w[uesr@example.com USER@foo.COM A_US-ER@foo.bar.org first.last@foo.jp alice+bob@baz.cn]
    valid_addresses.each do |valid_address|
      @user.email = valid_address
      assert @user.valid?, "#{valid_address.inspect} should be valid"
    end
  end

  test "email validation should reject invalid addresses" do
    invalid_addresses = %w[uesr@example,com user_at_foo.org user.name@example. foo@bar_baz.com foo@bar+baz.com foo@bar..com]
    invalid_addresses.each do |invalid_address|
      @user.email = invalid_address
      assert_not @user.valid?, "#{invalid_address.inspect} should be invalid"
    end
  end

  # emailが重複していないか
  test "email addresses shuold be unique" do
    duplicate_user = @user.dup
    duplicate_user.email = @user.email.upcase
    @user.save
    assert_not duplicate_user.valid?
  end

  # emailの小文字化
  test "email addresses should be saved as lower-case" do
    mixed_case_email = "Foo@ExAMPle.CoM"
    @user.email = mixed_case_email
    @user.save
    assert_equal mixed_case_email.downcase, @user.reload.email
  end

  #passwordが六文字以上か
  test "password should be present (nonblank)" do
    @user.password = @user.password_confirmation = " " * 6
    assert_not @user.valid?
  end

  test "password should have a minimum length" do
    @user.password = @user.password_confirmation = "a" * 5
    assert_not @user.valid?
  end

  # telが重複してないか
  test "tel number shuold be unique" do
    duplicate_user = @user.dup
    duplicate_user.tel = @user.tel.upcase
    @user.save
    assert_not duplicate_user.valid?
  end



  
end