class CreateRatings < ActiveRecord::Migration[5.0]
  def change
    create_table :ratings do |t|
      t.string :rating
      t.text :review
      t.references :seller,   foreign_key: { to_table: :users }
      t.references :buyer,    foreign_key: { to_table: :users }
      t.references :purchase, null: false,foreign_key: true
      t.timestamps
    end
  end
end
