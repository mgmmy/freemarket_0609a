class RemoveColumnsFromProducts5 < ActiveRecord::Migration[5.0]
  def change
    remove_column :products, :city
  end
end
