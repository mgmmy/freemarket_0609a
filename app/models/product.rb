class Product < ApplicationRecord
  belongs_to :user
  has_one :brand
  has_one :category
  has_one :status
  has_many :images
  has_many :favorites
  has_one :purchase
  has_many :comments
  accepts_nested_attributes_for :images
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
end
