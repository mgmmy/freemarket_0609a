class Product < ApplicationRecord
  belongs_to :user
  belongs_to :brand
  has_one    :category
  has_one    :status
  has_many   :images
  has_many   :favorites
  has_one    :purchase
  has_many   :comments
  belongs_to :condition
  belongs_to :delivery_method
  accepts_nested_attributes_for :images
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :shipping_date
end
