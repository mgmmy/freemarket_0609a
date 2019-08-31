class RemoveDeliveryFeeFromProducts < ActiveRecord::Migration[5.0]
  def change
    remove_column :products, :delivery_fee, :integer
  end
end
