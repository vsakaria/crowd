
require "curb"

class Search

  attr_accessor :artist, :track

  def initialize artist
    @artist = artist
  end

  def do_search
      @c = Curl::Easy.perform("http://developer.echonest.com/api/v4/song/search?api_key=JMEUQC5ZW6CHVBCXG&artist=#{@artist}")
  end

  def result
     @c.body_str
  end

end

