class RemoveAddressFromPurchases < ActiveRecord::Migration[5.0]
  def change
    remove_reference :purchases, :address, foreign_key: true
  end
end
