class RemovePrefectureFromAddress < ActiveRecord::Migration[5.0]
  def change
    remove_reference :addresses, :prefecture
  end
end
