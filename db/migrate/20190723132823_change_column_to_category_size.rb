class ChangeColumnToCategorySize < ActiveRecord::Migration[5.0]
  def up
    change_column(:category_sizes, :created_at, :datetime, :null => true)
    change_column(:category_sizes, :updated_at, :datetime, :null => true)
  end

  def down
    change_column(:category_sizes, :created_at, :datetime, :null => false)
    change_column(:category_sizes, :updated_at, :datetime, :null => false)
  end
end
