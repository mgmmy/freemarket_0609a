class CreateSocialMedia < ActiveRecord::Migration[5.0]
  def change
    create_table :social_media do |t|
      t.string :name , foreign_key: true
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
