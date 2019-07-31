class Address < ApplicationRecord
  belongs_to_active_hash :prefecture
  belongs_to :user
  has_one :prefecture
  has_many :purchases
end
