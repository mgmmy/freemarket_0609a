class AddAddressToPurchases2 < ActiveRecord::Migration[5.0]
  def change
    add_reference :purchases, :address, foreign_key: true
  end
end
