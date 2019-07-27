class DropDeliveryMethod < ActiveRecord::Migration[5.0]
  def change
    remove_foreign_key :products, :delivery_methods
    drop_table :delivery_methods
  end
end
