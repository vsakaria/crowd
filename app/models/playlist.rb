class Playlist < ActiveRecord::Base
  attr_accessible :artist_id, :artist_name, :id, :title, :user_id

  belongs_to :user
end

