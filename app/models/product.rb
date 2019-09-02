class Product < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :brand
  belongs_to :category
  has_one    :status
  has_many   :images, dependent: :destroy
  has_many   :favorites
  has_one    :purchase
  has_many   :comments
  belongs_to :condition
  belongs_to :size
  accepts_nested_attributes_for :images

  validates :name, :detail, :price, :user_id, :charge_id, :prefecture_id, 
            :condition_id, :delivery_method_id, :shipment_id,
            :category_id, presence: true
            
  validates :price, presence: true, numericality: {only_integer: true, greater_than: 299, less_than: 10000000}
  
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
  belongs_to_active_hash :delivery_method

  scope :recent_category, lambda { |count|
  where(category_id: count).order(created_at: :DESC).limit(4)
}
  scope :recent_brand, lambda { |count|
    where(brand_id: count).order(created_at: :DESC).limit(4)
  }
  scope :list_category, lambda { |count|
  where(category_id: count).order(created_at: :DESC).limit(130)
}

end
