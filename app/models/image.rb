class Image < ApplicationRecord
  mount_uploader :image, ImageUploader

  has_many :products
end
