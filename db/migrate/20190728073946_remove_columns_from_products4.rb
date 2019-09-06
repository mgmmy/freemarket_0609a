class RemoveColumnsFromProducts4 < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :charge_id, :integer
    add_column :products, :condition_id, :integer
    add_column :products, :delivery_method_id, :integer
    add_column :products, :shipment_id, :integer
    add_column :products, :status_id, :integer
  end
end
