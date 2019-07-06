class AddSmlCategoryToProduct < ActiveRecord::Migration[5.0]
  def change
    add_reference :products, :sml_category, foreign_key: true
  end
end
