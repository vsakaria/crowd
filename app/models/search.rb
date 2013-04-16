
require "curb"

class Search

  attr_accessor :artist, :track

  def initialize artist
    @artist = artist
  end

  def do_search
      @result = Curl::Easy.perform("http://developer.echonest.com/api/v4/song/search?api_key=JMEUQC5ZW6CHVBCXG&artist=#{@artist}").body_str

      parse_json(@result)
  end


private

def parse_json(result)
  parse_result = JSON.parse(result)
  parse_result["response"]["songs"]
end


end

