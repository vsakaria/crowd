require "curb"

class Search

  attr_accessor :artist, :track

  def initialize artist
    if !artist.empty?
      @artist = artist
    else
      @artist = nil
    end
  end

  def do_search
    if @artist

      @result = Curl::Easy.perform("http://developer.echonest.com/api/v4/song/search?api_key=JMEUQC5ZW6CHVBCXG&format=json&results=20&artist={@artist}&bucket=id:rdio-US&bucket=tracks&limit=true").body_str

      parse_json(@result)
    else
      nil
    end
  end

  private

    def parse_json(result)
      parse_result = JSON.parse(result)
      songs = parse_result["response"]["songs"]

      songs.each do |song|
        song.delete("audio_md5")
        song.delete("catalog")
        song.delete("id")
        song["tracks"][0]["foreign_id"]).split(":")[2]
      end

    end
end

