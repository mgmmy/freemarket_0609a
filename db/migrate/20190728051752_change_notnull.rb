class ChangeNotnull < ActiveRecord::Migration[5.0]
  def change
    def up
      change_column(:products, :user_id, :null => true)
    end
  
    def down
      change_column(:products, :user_id, :null => false)
    end
  end
end
