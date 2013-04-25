# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class User < ActiveRecord::Base
  attr_accessible :name, :first_name

  has_many :authentications
  has_many :playlists

  def self.find_or_create_from_auth_hash(auth_hash)
    info = auth_hash['info']
    name = info['name'] || info['email']
    find_or_create_by_name(name)
  end

  def first_name
    name.split(" ").first
  end
end
