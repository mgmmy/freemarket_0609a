class Product < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :brand
  belongs_to :category
  has_one    :status
  has_many   :images, dependent: :destroy
  has_many   :favorites, dependent: :destroy
  has_one    :purchase
  has_many   :comments
  has_many   :like_users, through: :favorites, source: :user 
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

  scope :recent_category, lambda { |count|
  where(category_id: count).order(created_at: :DESC).limit(4)
}
  scope :recent_brand, lambda { |count|
    where(brand_id: count).order(created_at: :DESC).limit(4)
  }
  scope :list_category, lambda { |count|
  where(category_id: count).order(created_at: :DESC).limit(130)
}

  # def heart(user)
  #   favorites.create(user_id: user)
  # end

  # def unheart(user)
  #   favorites.find_by(user_id: user).destroy
  # end

  # def heart?(user)
  #   like_users.include?(user)
  # end  

  def liked_user(user_id)
    favorites.find_by(user_id: user_id)
  end
end
