class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :spotify_id
      t.string :spotify_access_token
      t.string :spotify_refresh_token

      t.timestamps
    end
    add_index :users, :spotify_id, unique: true
  end
end
