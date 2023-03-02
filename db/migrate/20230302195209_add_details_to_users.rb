class AddDetailsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :email, :string
    add_column :users, :display_name, :string
    add_column :users, :image_url, :string

    add_index :users, :email, unique: true
    add_index :users, :display_name
  end
end
