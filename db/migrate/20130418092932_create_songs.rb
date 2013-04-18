class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.string :artist_id
      t.string :artist_name
      t.string :title
      t.string :song_id

      t.timestamps
    end
  end
end
