require 'test_helper'
require 'mocha/setup'

class SearchTest < ActiveSupport::TestCase
  setup do
    setup_stubs
  end

  test "do search returns an array" do

    search = Search.new("U2")

    assert_instance_of Array, search.do_search
  end

  # test "do search returns array of song hashes" do

  #   search = Search.new("U2")

  #   result = search.do_search

  #   songs = [result.first, result.last, result.sample]
  #   songs.each do |song|
  #   assert song.has_key?('title')
  # end


  test "do search returns array of specfic song hashes" do

    search = Search.new("U2")

    @result = search.do_search

    assert @result.first.has_key?(:artist_name)
    assert @result.first.has_key?(:artist_id)
    assert @result.first.has_key?(:title)
    assert @result.first.has_key?(:tracks_rdio_id)
    assert @result.first.has_key?(:id)
    assert_equal false, @result.first.has_key?(:audio_md5)

  end

  test "Api is not called if input is empty" do

    search = Search.new("")
    assert_nil search.do_search

  end

 def setup_stubs
    result = OpenStruct.new({body_str: %q|{"response": {"status": {"version": "4.2", "code": 0, "message": "Success"}, "songs": [{"title": "New Year's Day (Vocal Extended Mix - Ferry Corsten Remix)", "artist_name": "U2", "id": "SOAUKYG1338A5E66EE", "tracks": [{"foreign_release_id": "rdio-US:release:a228286", "catalog": "rdio-US", "foreign_id": "rdio-US:track:t2767044", "id": "TRPXGWF136E83C3B9D"}], "artist_id": "ARUJ5A41187FB3F5F1", "audio_md5": "cbb90fc2142354e653006fd91ea630c8"}, {"title": "The Three Sunrises", "artist_name": "U2", "id": "SOBQJOP1338A635A0D", "tracks": [{"foreign_release_id": "rdio-US:release:a225664", "catalog": "rdio-US", "foreign_id": "rdio-US:track:t2732721", "id": "TRVTPLN136E837F7EA"}], "artist_id": "ARUJ5A41187FB3F5F1", "audio_md5": "138d539dc761a5018f90ae6183b2a30f"}, {"title": "Love And Peace Or Else", "artist_name": "U2", "id": "SOCBKYJ1338A5FA1DB", "tracks": [{"foreign_release_id": "rdio-US:release:a233771", "catalog": "rdio-US", "foreign_id": "rdio-US:track:t2836103", "id": "TRTQTLA136E8441D30"}], "artist_id": "ARUJ5A41187FB3F5F1", "audio_md5": "e8eb8d0fee52a88a481173e8788b0c57"}, {"title": "Blow Your House Down", "artist_name": "U2", "id": "SOGWGAN133A920EACC", "tracks": [{"foreign_release_id": "rdio-US:release:a1088452", "catalog": "rdio-US", "foreign_id": "rdio-US:track:t12471872", "id": "TRSEBNK136BCA0C108"}], "artist_id": "ARUJ5A41187FB3F5F1", "audio_md5": "a1c254cab55089e1a67d2b75161e81ff"}, {"title": "Even Better Than The Real Thing (Fish Out Of Water Remix)", "artist_name": "U2", "id": "SOXIHXF133A921C365", "tracks": [{"foreign_release_id": "rdio-US:release:a1088452", "catalog": "rdio-US", "foreign_id": "rdio-US:track:t12471896", "id": "TRGDAVT136BCA0C4A2"}], "artist_id": "ARUJ5A41187FB3F5F1", "audio_md5": "0c9584a9bcce5f554a224a6d187519b0"}, {"title": "The Saints Are Coming", "artist_name": "U2", "id": "SOCWJXJ12B0B807508", "tracks": [{"foreign_release_id": "rdio-US:release:a229238", "catalog": "rdio-US", "foreign_id": "rdio-US:track:t2780292", "id": "TRYHOPH136E83DB06F"}, {"foreign_release_id": "rdio-US:release:a223551", "catalog": "rdio-US", "foreign_id": "rdio-US:track:t2705460", "id": "TRRXDTP136E834F3E0"}], "artist_id": "ARUJ5A41187FB3F5F1", "audio_md5": "90216ac231a3d81ffd9e7867e069008d"}, {"title": "One", "artist_name": "U2", "id": "SOIFREZ12B0B809F8F", "tracks": [{"foreign_release_id": "rdio-US:release:a1088452", "catalog": "rdio-US", "foreign_id": "rdio-US:track:t12471817", "id": "TRZRWQO136BCA0BFD5"}, {"foreign_release_id": "rdio-US:release:a254519", "catalog": "rdio-US", "foreign_id": "rdio-US:track:t3118467", "id": "TRHIYBW136E86ADF0A"}, {"foreign_release_id": "rdio-US:release:a223551", "catalog": "rdio-US", "foreign_id": "rdio-US:track:t2705088", "id": "TRPOAEN136E834EC5C"}, {"foreign_release_id": "rdio-US:release:a253047", "catalog": "rdio-US", "foreign_id": "rdio-US:track:t3098157", "id": "TRSGTUU136E8685740"}, {"foreign_release_id": "rdio-US:release:a229238", "catalog": "rdio-US", "foreign_id": "rdio-US:track:t2779944", "id": "TRYVRYA136E83DA9AF"}, {"foreign_release_id": "rdio-US:release:a236063", "catalog": "rdio-US", "foreign_id": "rdio-US:track:t2865350", "id": "TRBPURH136E8475700"}], "artist_id": "ARUJ5A41187FB3F5F1", "audio_md5": "a93d57719cf6b0bb1a01c5eecfeb635c"}, {"title": "Red Light", "artist_name": "U2", "id": "SOGWVOL12B0B809F73", "tracks": [{"foreign_release_id": "rdio-US:release:a228286", "catalog": "rdio-US", "foreign_id": "rdio-US:track:t2766597", "id": "TRQLZZU136E83C3042"}, {"foreign_release_id": "rdio-US:release:a380545", "catalog": "rdio-US", "foreign_id": "rdio-US:track:t4646642", "id": "TRIENSV136E9E29B81"}], "artist_id": "ARUJ5A41187FB3F5F1", "audio_md5": "8ae66b456e1aa984a9506dd5c9157455"}, {"title": "Acrobat", "artist_name": "U2", "id": "SOFCYBX12B0B809F8A", "tracks": [{"foreign_release_id": "rdio-US:release:a254519", "catalog": "rdio-US", "foreign_id": "rdio-US:track:t3119262", "id": "TRKOWQO136E86AF89C"}, {"foreign_release_id": "rdio-US:release:a1088452", "catalog": "rdio-US", "foreign_id": "rdio-US:track:t12471858", "id": "TRQBCBG136BCA0C0B6"}], "artist_id": "ARUJ5A41187FB3F5F1", "audio_md5": "04973a762ee411610b43d7e64ba4d90f"}, {"title": "The Three Sunrises", "artist_name": "U2", "id": "SODJRGW1338A5D6853", "tracks": [{"foreign_release_id": "rdio-US:release:a256670", "catalog": "rdio-US", "foreign_id": "rdio-US:track:t3147457", "id": "TRUWGYB136E86E3C42"}], "artist_id": "ARUJ5A41187FB3F5F1", "audio_md5": "fa9f89b65c9ffc4c725a31da7b1063cb"}, {"title": "Zooropa", "artist_name": "U2", "id": "SOBXJYS1338A5E5304", "tracks": [{"foreign_release_id": "rdio-US:release:a268647", "catalog": "rdio-US", "foreign_id": "rdio-US:track:t3290767", "id": "TRQBZHS136E87FA67F"}], "artist_id": "ARUJ5A41187FB3F5F1", "audio_md5": "9fc4ca0380b4ac3d71fa6efad8033441"}, {"title": "Mothers Of The Disappeared", "artist_name": "U2", "id": "SOMMHPI1338A5D39A6", "tracks": [{"foreign_release_id": "rdio-US:release:a232738", "catalog": "rdio-US", "foreign_id": "rdio-US:track:t2824454", "id": "TRSHJER136E842D363"}, {"foreign_release_id": "rdio-US:release:a258687", "catalog": "rdio-US", "foreign_id": "rdio-US:track:t3174573", "id": "TRGYZLS136E8717E08"}, {"foreign_release_id": "rdio-US:release:a232791", "catalog": "rdio-US", "foreign_id": "rdio-US:track:t2825009", "id": "TRMOFMN136E842E3CE"}], "artist_id": "ARUJ5A41187FB3F5F1", "audio_md5": "d469c05a53790b6dec6b1ef13e97ae85"}, {"title": "Elevation (2005 Live From Milan)", "artist_name": "U2", "id": "SODMNSK1340BB9E413", "tracks": [{"foreign_release_id": "rdio-US:release:a223551", "catalog": "rdio-US", "foreign_id": "rdio-US:track:t2705748", "id": "TRTFCBB136E834F9B4"}], "artist_id": "ARUJ5A41187FB3F5F1", "audio_md5": "395f431edc6bdcee836b5b47835a7471"}, {"title": "Sunday Bloody Sunday", "artist_name": "U2", "id": "SOZADYQ135C1BBF8FE", "tracks": [{"foreign_release_id": "rdio-US:release:a234415", "catalog": "rdio-US", "foreign_id": "rdio-US:track:t2844561", "id": "TRQHQWX136E8450A69"}], "artist_id": "ARUJ5A41187FB3F5F1", "audio_md5": "16a222f7b6f1eb350ebf78442a275dc4"}, {"title": "Wire", "artist_name": "U2", "id": "SOTEQHI135C27B8EA7", "tracks": [{"foreign_release_id": "rdio-US:release:a225664", "catalog": "rdio-US", "foreign_id": "rdio-US:track:t2731723", "id": "TRMMWMM136E837D6F6"}, {"foreign_release_id": "rdio-US:release:a225594", "catalog": "rdio-US", "foreign_id": "rdio-US:track:t2730989", "id": "TRLCFBD136E837BFC8"}], "artist_id": "ARUJ5A41187FB3F5F1", "audio_md5": "a661fcc89a8bf2e64e55d58b2f024622"}, {"title": "Walk On", "artist_name": "U2", "id": "SOGXABA135C2C03605", "tracks": [{"foreign_release_id": "rdio-US:release:a236238", "catalog": "rdio-US", "foreign_id": "rdio-US:track:t2867698", "id": "TRKFMOM136E8479864"}], "artist_id": "ARUJ5A41187FB3F5F1", "audio_md5": "0680eb3b8eef4973fed8d2d8faa123c5"}, {"title": "Sometimes You Can't Make It On Your Own", "artist_name": "U2", "id": "SOPBWBT135C2FDF8B5", "tracks": [{"foreign_release_id": "rdio-US:release:a223551", "catalog": "rdio-US", "foreign_id": "rdio-US:track:t2705369", "id": "TRTSKQH136E834F19B"}, {"foreign_release_id": "rdio-US:release:a229238", "catalog": "rdio-US", "foreign_id": "rdio-US:track:t2780210", "id": "TRPGQUO136E83DAEB2"}, {"foreign_release_id": "rdio-US:release:a233771", "catalog": "rdio-US", "foreign_id": "rdio-US:track:t2836012", "id": "TRNSMMM136E8441AE9"}], "artist_id": "ARUJ5A41187FB3F5F1", "audio_md5": "193b18282f58765ee2741acb209d64f3"}, {"title": "Who's Gonna Ride Your Wild Horses", "artist_name": "U2", "id": "SODDWWJ135C43A812C", "tracks": [{"foreign_release_id": "rdio-US:release:a234944", "catalog": "rdio-US", "foreign_id": "rdio-US:track:t2849647", "id": "TRLIDLO136E84597A4"}], "artist_id": "ARUJ5A41187FB3F5F1", "audio_md5": "c389dd507b0026fd7cce7d92d441ca8e"}, {"title": "Sunday Bloody Sunday", "artist_name": "U2", "id": "SONHSHT135CAD95D9B", "tracks": [{"foreign_release_id": "rdio-US:release:a828789", "catalog": "rdio-US", "foreign_id": "rdio-US:track:t9725892", "id": "TRZZUUX136F4108C0A"}], "artist_id": "ARUJ5A41187FB3F5F1", "audio_md5": "bb4e73090445c713d5945d224a465dc3"}, {"title": "New Year's Day (Single Edit - Remastered)", "artist_name": "U2", "id": "SOAVLFB135CB421C59", "tracks": [{"foreign_release_id": "rdio-US:release:a228286", "catalog": "rdio-US", "foreign_id": "rdio-US:track:t2766897", "id": "TRLJAOR136E83C37AC"}], "artist_id": "ARUJ5A41187FB3F5F1", "audio_md5": "973c8bdd60595631f2fba17f069501d7"}]}}|})
    Curl::Easy.stubs(:perform).returns result
  end
end



