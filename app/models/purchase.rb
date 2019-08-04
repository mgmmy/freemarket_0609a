class Purchase < ApplicationRecord
  belongs_to :buyer class_name: 'User', foreign_key: 'buyer_id'			
  belongs_to :seller class_name: 'User', foreign_key: 'seller_id'			
  belongs_to :product			
  has_one :address			
  has_one :card			
  has_one :rating			
end
