class CreatePurchases < ActiveRecord::Migration[5.0]
  def change
    create_table :purchases do |t|
      t.integer :payment,        null: false
      t.string :payment_method
      t.references :product,     null: false,foreign_key: true
      t.references :seller,      foreign_key: { to_table: :users }
      t.references :buyer,      foreign_key: { to_table: :users }
      t.timestamps
    end
  end
end
