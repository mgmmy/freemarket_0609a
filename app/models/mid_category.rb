class MidCategory < ApplicationRecord
  has_many :products			
  belongs_to :lar_categories			
  has_many :sml_category			
  has_many :siezes			
end
