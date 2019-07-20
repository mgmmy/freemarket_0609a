class SmlCategory < ApplicationRecord
  has_many :products			
  has_one :sml_category			
end
