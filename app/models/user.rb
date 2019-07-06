class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # 名前の長さチェック
  validates :last_name, presence: true, length: { maximum: 20 }
  validates :first_name, presence: true, length: { maximum: 20 }
  validates :last_name_kana, presence: true, length: { maximum: 20 }
  validates :first_name_kana, presence: true, length: { maximum: 20 }
  # emailを小文字に変換
  before_save { self.email = email.downcase }
  # emailの有効性
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  # emailの長さ,重複,有効性
  validates :email, presence: true, length: { maximum: 100 }, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }

  #password
  has_secure_password
  
  # telの長さ,重複,有効性
  VALID_TEL_REGEX = /\A\d{10,11}\z/
  validates :tel, presence: true, format: { with: VALID_TEL_REGEX }, uniqueness: { case_sensitive: false }

end
