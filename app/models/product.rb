class Product < ApplicationRecord
  belongs_to :user
  has_one :brand
  has_one :lar_category
  has_one :mid_category
  has_one :sml_category
  has_one :size
  has_many :images
  has_many :favorites
  has_one :purchase
  has_many :comments

  accepts_nested_attributes_for :images
end
