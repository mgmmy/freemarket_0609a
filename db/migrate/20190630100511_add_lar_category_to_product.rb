class AddLarCategoryToProduct < ActiveRecord::Migration[5.0]
  def change
    add_reference :products, :lar_category, foreign_key: true
  end
end
