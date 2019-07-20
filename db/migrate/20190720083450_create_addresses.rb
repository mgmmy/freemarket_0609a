class CreateAddresses < ActiveRecord::Migration[5.0]
  def change
    create_table :addresses do |t|
      add_column :addresses, :zip_code, :integer,            null: false, foreign_key: true
      add_column :addresses, :prefecture_id, :reference,     null: false
      add_column :addresses, :city, :string,                 null: false
      add_column :addresses, :block, :string,                null: false
      add_column :addresses, :building, :string
      add_column :addresses, :uer_id, :reference,            null: false, foreign_key: true
      t.timestamps
    end

    belongs_to :user
    has_one :prefecture
    has_many :purchases
  end
end
