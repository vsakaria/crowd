class Song < ActiveRecord::Base
  attr_accessible :artist_id, :artist_name, :song_id, :title, :playlist_id

  belongs_to :playlist

end
