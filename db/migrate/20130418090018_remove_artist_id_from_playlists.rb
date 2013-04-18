class RemoveArtistIdFromPlaylists < ActiveRecord::Migration
  def up
    remove_column :playlists, :artist_id, :artist_name
  end

  def down
    add_column :playlists, :artist_id, :string
    add_column :playlists, :artist_name, :string
  end
end
