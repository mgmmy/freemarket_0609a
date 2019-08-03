class RemoveRefFromProducts < ActiveRecord::Migration[5.0]
  def change
    remove_reference :products, :categories, foreign_key: true
  end
end
