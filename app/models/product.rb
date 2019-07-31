class Product < ApplicationRecord
  belongs_to :user, optional: true
  has_one :brand
  belongs_to :category
  has_one :status
  has_many :images
  has_many :favorites
  has_one :purchase
  has_many :comments
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

  scope :recent_category, lambda { |count|
  where(categories_id: count).order(created_at: :DESC).limit(4)
}
  scope :recent_brand, lambda { |count|
    where(brand_id: count).order(created_at: :DESC).limit(4)
  }


end
