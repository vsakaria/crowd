class CreatePlaylists < ActiveRecord::Migration
  def change
    create_table :playlists do |t|
      t.string :artist_id
      t.string :id
      t.string :artist_name
      t.string :title

      t.timestamps
    end
  end
end
