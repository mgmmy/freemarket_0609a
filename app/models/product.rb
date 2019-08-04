class Product < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :brand
  belongs_to :category
  has_one    :status
  has_many   :images
  has_many   :favorites
  has_one    :purchase
  has_many   :comments
  belongs_to :condition
  accepts_nested_attributes_for :images

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :shipment
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :condition
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :charge
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :status
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :shipping_date
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :delivery_method
end
