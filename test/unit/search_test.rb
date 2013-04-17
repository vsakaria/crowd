require 'test_helper'
require 'mocha/setup'

class SearchTest < ActiveSupport::TestCase
  setup do
    setup_stubs
  end

  test "do search returns an array" do

    #How can I run a assert what I expect before the setup isI can'tsetup a search object.

    search = Search.new("U2")

    assert_instance_of Array, search.do_search
  end

  test "do search returns song title" do

    search = Search.new("U2")

    assert_not_nil search.do_search.include?('title')
  end

  test "Api is not called if input in empty" do

    search = Search.new("")

    assert_nil search.do_search

  end


 def setup_stubs
    result = OpenStruct.new({body_str: %q|{"response": {"status": {"version": "4.2", "code": 0, "message": "Success"}, "songs": [{"artist_id": "ARUJ5A41187FB3F5F1", "id": "SOPQRVS12B3A13BC68", "artist_name": "U2", "title": "ELECTRICAL STORM (Ulrick Mix)"}, {"artist_id": "ARUJ5A41187FB3F5F1", "id": "SOSFBOB1315CD45D42", "artist_name": "U2", "title": "With A Shout (Jerusalem)"}, {"artist_id": "ARUJ5A41187FB3F5F1", "id": "SOWXFFC12AB0185A41", "artist_name": "U2", "title": "I'll Go Crazy If I Don't Go Crazy Tonight (Redanka's 'Sparks Of Light' Dub Version)"}, {"artist_id": "ARUJ5A41187FB3F5F1", "id": "SOOPHCK12A6310DF9C", "artist_name": "U2", "title": "Even Better Than The Real Thing"}, {"artist_id": "ARUJ5A41187FB3F5F1", "id": "SONUERE12C106D207D", "artist_name": "U2", "title": "Elevation (Biffco Mix)"}, {"artist_id": "ARUJ5A41187FB3F5F1", "id": "SOMNCFE1315CD46264", "artist_name": "U2", "title": "Beautiful Ghost/Introduction To Songs Of Experience"}, {"artist_id": "ARUJ5A41187FB3F5F1", "id": "SOZNHEJ12A8AE49B58", "artist_name": "U2", "title": "Saturday Night"}, {"artist_id": "ARUJ5A41187FB3F5F1", "id": "SOIKZEO1315CD45C0F", "artist_name": "U2", "title": "Touch"}, {"artist_id": "ARUJ5A41187FB3F5F1", "id": "SOMMZZN12A6310E1B3", "artist_name": "U2", "title": "Salome"}, {"artist_id": "ARUJ5A41187FB3F5F1", "id": "SOSWTDZ12A6D4F8C33", "artist_name": "U2", "title": "Vertigo (2005 Live From Milan)"}, {"artist_id": "ARUJ5A41187FB3F5F1", "id": "SOGGNRH12A6310E1B0", "artist_name": "U2", "title": "Mysterious Ways (Solar Plexus Club Mix)"}, {"artist_id": "ARUJ5A41187FB3F5F1", "id": "SOXONDJ12AB017DFB7", "artist_name": "U2", "title": "A Sort Of Homecoming (Danny Lanois Remix)"}, {"artist_id": "ARUJ5A41187FB3F5F1", "id": "SOGWUPC12AB017ADA3", "artist_name": "U2", "title": "Disappearing Act"}, {"artist_id": "ARUJ5A41187FB3F5F1", "id": "SOVABKN12A6310E20D", "artist_name": "U2", "title": "Elevation (Escalation Mix)"}, {"artist_id": "ARUJ5A41187FB3F5F1", "id": "SOWYAIX12A6310E1F4", "artist_name": "U2", "title": "Numb (The Soul Assassins Mix)"}]}}|})
    Curl::Easy.stubs(:perform).returns result
  end
end
