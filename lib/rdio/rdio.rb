# require 'oauth/consumer'
# OAuth::VERSION = 1

require 'json'

SITE = 'http://api.rdio.com'

PATH = '/1/'

class Rdio
  def initialize(key, secret)
    @consumer = OAuth::Consumer.new key, secret, {:site => SITE}
    @consumer.http.read_timeout = 600 # ten-minute timeout, thanks
    @access_token = OAuth::AccessToken.new @consumer
  end

  def method_missing(method, args = {})
    # puts "RDIO-method_missing (method:[#{method}], args:[#{args}])"
    args[:method] = method.to_s
    # args = {:method => "getTracksForArtist", :query => "julia", :types => "Track"}
    response = @access_token.post PATH, args
    return response.body
  end
end