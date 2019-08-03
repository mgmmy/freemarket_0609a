class DropStatus < ActiveRecord::Migration[5.0]
  def change
    remove_foreign_key :products, :statuses
    drop_table :statuses
  end
end
