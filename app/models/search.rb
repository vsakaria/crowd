require "curb"
require 'rdio/rdio'

class Search

  attr_accessor :artist, :result, :url, :songs

  def initialize artist
    if !artist.empty?
      @artist = artist
    else
      @artist = nil
    end
    @rdio = Rdio.new #(CONSUMER_KEY, CONSUMER_SECRET)
  end

  def do_search
    if @artist
      # TODO what if no artist id was found?
      songs = find_tracks_by_artist_name(@artist)
    else
      nil
    end
  end

  private

  def find_tracks_by_artist_name(artist)
    puts "find_tracks_by_artist(#{artist})"
    if tracks = search_rdio_by_artist(artist)
      filter_streamable(tracks)
      songs = create_results(tracks)
    else
      # what do we do here if no results?
    end
  end

  def search_rdio_by_artist(artist)
    puts "search_rdio_by_artist - determining Rdio Artist ID - #{artist}"
    x = @rdio.search(query: "#{artist}", types: "Artist")
    parse_result = JSON.parse(x)
    y = parse_result["result"]["results"]
    artist_key = y.first['key']

    puts "Now use key [#{artist_key}] for [#{artist}] to get tracks"
    track_results = @rdio.getTracksForArtist(artist: "#{artist_key}")
    parse_result = JSON.parse(track_results)
    all_tracks = parse_result["result"]
  end

  def filter_streamable(tracks)
    # only include tracks that are streamable
    valid_tracks = tracks.select { |track| track['canStream'] == true }
  end

  def create_results(tracks)
    tracks.map do |song|
      {
        :title => song["name"],
        :artist_id => song["artistKey"],
        :artist_name => song["artist"],
        :id => song["key"],
        :tracks_rdio_id => song["key"]
      }
    end
  end
end
