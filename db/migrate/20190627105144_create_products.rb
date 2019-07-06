class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :name,     null: false
      t.text :detail
      t.integer :price,   null: false
      t.references :user, null: false,foreign_key: true
      t.integer :like
      t.integer :delivery_fee
      t.timestamps
    end
  end
end
