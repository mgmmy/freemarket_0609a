class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :address
  has_many :cards
  has_many :products
  has_many :buyer_purchases, class_name: 'Purchases', :foreign_key => 'buyer_id'
  has_many :seller_purchases, class_name: 'Purchases', :foreign_key => 'seller_id'
  has_many :ratings
  has_one :profile
  has_many :comments
  has_many :purchases
end
