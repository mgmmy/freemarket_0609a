class RemoveImageFromProduct < ActiveRecord::Migration[5.0]
  def change
    remove_reference :products, :image, foreign_key: true
  end
end
