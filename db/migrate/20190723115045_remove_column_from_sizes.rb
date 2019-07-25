class RemoveColumnFromSizes < ActiveRecord::Migration[5.0]
  def change
    remove_column :sizes, :clothe, :string
    remove_column :sizes, :mens_shoes, :string
    remove_column :sizes, :ladies_shoes, :string
  end
end
