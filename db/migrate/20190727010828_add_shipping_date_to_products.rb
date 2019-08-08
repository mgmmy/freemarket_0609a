class AddShippingDateToProducts < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :shipping_date_id, :integer
    add_column :products, :date, :string
  end
end
