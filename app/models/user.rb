class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [:facebook, :google]

  has_one  :address
  accepts_nested_attributes_for :address
  has_many :cards
  has_many :products
  has_many :buyer_purchases, class_name: 'Purchases', :foreign_key => 'buyer_id'
  has_many :seller_purchases, class_name: 'Purchases', :foreign_key => 'seller_id'
  has_many :ratings
  has_one  :profile
  accepts_nested_attributes_for :profile
  has_many :comments
  has_many :purchases
  has_many :sns_credentials, dependent: :destroy
  
  # validates :nickname, :encrypted_password, :last_name, :first_name, :last_name_kana, :first_name_kana

  def self.find_oauth(auth)
    uid = auth.uid
    provider = auth.provider
    snscredential = SnsCredential.where(uid: uid, provider: provider).first
    if snscredential.present?
      user = User.where(id: snscredential.user_id).first
    else
      user = User.where(email: auth.info.email).first
      if user.present?
        SnsCredential.create(
          uid: uid,
          provider: provider,
          user_id: user.id
          )
      else
        user = User.create(
          nickname:   auth.info.name,
          email:      auth.info.email,
          password:   Devise.friendly_token[0, 20],
          last_name:  auth.info.last_name,
          first_name: auth.info.first_name
          )
        SnsCredential.create(
          uid: uid,
          provider: provider,
          user_id: user.id
          )
      end
    end
    return user
  end
end
