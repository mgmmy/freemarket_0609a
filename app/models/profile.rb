class Profile < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  delegate :name, to: :prefecture
  belongs_to :user
  has_one :prefecture
  has_many :purchases

  validates :postalcode, :city, :block, :tel, presence: true
  
end
