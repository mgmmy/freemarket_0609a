class AddDeliveryMethodToProduct < ActiveRecord::Migration[5.0]
  def change
    add_reference :products, :delivery_method, foreign_key: true
  end
end
