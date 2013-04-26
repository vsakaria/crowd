# require 'oauth/consumer'
# OAuth::VERSION = 1

require 'json'

SITE = 'http://api.rdio.com'

PATH = '/1/'

class Rdio
  def initialize
    # @consumer = OAuth::Consumer.new Rdio.key, Rdio.secret, Rdio.rdio_domain, {:site => SITE}
    @consumer = OAuth::Consumer.new Rdio.key, Rdio.secret, {:site => SITE}
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

  def self.api_keys(key, secret, streaming_token)
    @key = key
    @secret = secret
    @streaming_token = streaming_token
  end

  def self.key
    @key
  end

  def self.secret
    @secret
  end

  def self.streaming_token
    @streaming_token
  end
end