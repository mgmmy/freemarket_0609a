class ChangePurchase < ActiveRecord::Migration[5.0]
  def change
    remove_column :purchases, :payment, :integer
  end
end
