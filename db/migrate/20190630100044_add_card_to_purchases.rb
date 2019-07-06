class AddCardToPurchases < ActiveRecord::Migration[5.0]
  def change
    add_reference :purchases, :card, foreign_key: true
  end
end
