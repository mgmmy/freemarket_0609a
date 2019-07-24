class ChangeDataTypeTelFromUsers < ActiveRecord::Migration[5.0]
  def change
    change_column :users, :tel, :string, null: false, unique: true
  end
end
