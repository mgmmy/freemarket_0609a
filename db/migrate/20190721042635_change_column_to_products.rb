class ChangeColumnToProducts < ActiveRecord::Migration[5.0]
  def up
    change_column_null :users, :last_name, true
    change_column_null :users, :first_name, true
    change_column_null :users, :last_name_kana, true
    change_column_null :users, :first_name_kana, true
    # change_column_null :users, :birthday, true
    # change_column_null :users, :tel, true
  end

  def down
    change_column_null :users, :last_name, false
    change_column_null :users, :first_name, false
    change_column_null :users, :last_name_kana, false
    change_column_null :users, :first_name_kana, false
    # change_column_null :users, :birthday, false
    # change_column_null :users, :tel, false
  end
end
