# == Schema Information
#
# Table name: playlists
#
#  id          :integer          not null, primary key
#  artist_id   :string(255)
#  artist_name :string(255)
#  title       :string(255)
#  user_id     :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Playlist < ActiveRecord::Base
  attr_accessible :artist_id, :artist_name, :id, :title, :user_id

  belongs_to :user
  has_many :songs


end

