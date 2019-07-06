class CreateAddresses < ActiveRecord::Migration[5.0]
  def change
    create_table :addresses do |t|
      t.integer :zip_code,      null: false
      t.references :prefecture, null: false,foreign_key: true
      t.string :city,           null: false
      t.string :block,          null: false
      t.string :building
      t.references :user,       null: false,foreign_key: true
      t.timestamps
    end
  end
end
