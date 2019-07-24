class AddColumnsToSnsCredentials < ActiveRecord::Migration[5.0]
  def change
    add_column :sns_credentials, :name, :string
    add_column :sns_credentials, :nickname, :string
    add_column :sns_credentials, :email, :string
    add_column :sns_credentials, :url, :string
    add_column :sns_credentials, :image_url, :string
    add_column :sns_credentials, :description, :string
    add_column :sns_credentials, :other, :text
    add_column :sns_credentials, :credentials, :text
    add_column :sns_credentials, :raw_info, :text
  end
  add_index :sns_credentials, [:provider, :uid], unique: true
end
