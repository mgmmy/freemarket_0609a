class Image < ApplicationRecord
  mount_uploader :image, ImageUploader
  belongs_to :products, inverse_of: :images
end
