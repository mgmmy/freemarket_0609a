class ShipmentProducts < ActiveRecord::Migration[5.0]
  def change
    remove_foreign_key :products, :shipments
    drop_table :shipments
  end
end
