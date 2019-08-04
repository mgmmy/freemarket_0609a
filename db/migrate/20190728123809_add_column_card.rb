class AddColumnCard < ActiveRecord::Migration[5.0]
  def change
    add_column :cards, :customer_id, :integer, null: false
    add_column :cards, :card_id, :integer, null: false
  end
end