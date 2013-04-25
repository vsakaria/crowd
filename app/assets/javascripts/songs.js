// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$(document).ready(function() {
  $(document).on('submit', '.remove-from-playlist-form', function(e) {
    e.preventDefault();
    var selected_song = $(this);
    var song_title = $(this).find('label').text();
    var removeFromPlaylist = function(song_title) {
      $.get( '/songs', 
              { song: {title: song_title} }
            )
      .success(function(data) {
        $(selected_song).hide();
      });
    }
    alert('you wanna remove me ' + song_title);
    removeFromPlaylist(song_title)
  });
});