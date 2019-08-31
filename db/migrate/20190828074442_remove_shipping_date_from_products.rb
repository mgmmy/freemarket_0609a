class RemoveShippingDateFromProducts < ActiveRecord::Migration[5.0]
  def change
    remove_column :products, :shipping_date_id, :integer
    remove_column :products, :date, :string
  end
end
