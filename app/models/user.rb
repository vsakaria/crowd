class User < ActiveRecord::Base
  attr_accessible :name

  has_many :authentications
  has_many :playlists

  def self.find_or_create_from_auth_hash(auth_hash)
    info = auth_hash['info']
    name = info['name'] || info['email']
    find_or_create_by_name(name)
  end
end