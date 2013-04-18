class Song < ActiveRecord::Base
  attr_accessible :artist_id, :artist_name, :song_id, :title

  belongs_to :playlist

end
