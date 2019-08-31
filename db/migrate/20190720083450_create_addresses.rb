class CreateAddresses < ActiveRecord::Migration[5.0]
  def change
    create_table :addresses do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :first_name_kana, null: false
      t.string :last_name_kana, null: false
      t.string :postalcode
      t.references :prefectures, null: false
      t.string :city, null: false
      t.string :block, null: false
      t.string :building 
      t.integer :user_id, null: false, foreign_key: true
      t.string :tel, null: false, unique: true
    end
  end
end
