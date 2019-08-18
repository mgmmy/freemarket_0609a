class DropConditions < ActiveRecord::Migration[5.0]
  def change
    remove_foreign_key :products, :conditions
    drop_table :conditions
  end
end
