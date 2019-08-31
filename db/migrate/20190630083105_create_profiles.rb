class CreateProfiles < ActiveRecord::Migration[5.0]
  def change
    create_table :profiles do |t|
      t.text :introduce
      t.references :user, foreign_key: true
      t.string :first_name
      t.string :last_name
      t.string :first_name_kana
      t.string :last_name_kana
      t.string :postalcode
      t.string :prefecture_id
      t.string :city
      t.string :block
      t.string :building 
      t.string :tel, unique: true
      t.date :birthday
      t.timestamps
    end
  end
end
