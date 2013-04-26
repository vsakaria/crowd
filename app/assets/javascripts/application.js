// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.

// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.

// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.

// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.

// = require jquery
// = require jquery_ujs
// = require bootstrap
// = require_tree .
// = require_self

$(function() {

// var playback_token = @rdio.getPlaybackToken(domain: "#{Rdio.rdio_domain}");
// console.log("getPlaybackToken: [" + playback_token + ']');

  // var playback_token = production ? 
  // $('#rdio').rdio(playback_token);

  $('#rdio').rdio("GBZReaPd_____3pkdXMyeXQ5eHVteWdqeHd4bW1kZndra2Nyb3dkLWRqLmhlcm9rdWFwcC5jb20ng_nNie-3N3N583R9pVeh\=");
  // $('#rdio').rdio("GAlNi78J_____zlyYWs5ZG02N2pkaHlhcWsyOWJtYjkyN2xvY2FsaG9zdEbwl7EHvbylWSWFWYMZwfc=");


  $('#rdio').on('ready.rdio', function() {
    console.log("ready to play");
  });
});


