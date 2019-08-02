class RemoveColumnsFromProducts3 < ActiveRecord::Migration[5.0]
  def change
    # remove_foreign_key :products, :charges
    # remove_reference :products, :charges, index: true
    remove_foreign_key :products, :conditions
    remove_reference :products, :condition, index: true
    # remove_foreign_key :products, :delivery_methods
    # remove_reference :products, :delivery_method, index: true
    # remove_foreign_key :products, :shipments
    # remove_reference :products, :shipment, index: true
  end
end
