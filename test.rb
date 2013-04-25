require './lib/rdio/rdio'
require 'debugger'


r = Rdio.new(CONSUMER_KEY, CONSUMER_SECRET)
puts r.getTracksForArtist(:keys => "artist=u2")
# puts r.call('getTracksForArtist',  )