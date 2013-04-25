// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$(document).ready(function() {

  $(document).on('submit.add-song-submit-btn', '.add-to-playlist-form', function(e) {
    e.preventDefault();
    var selected_song = $(this);
    var song_title = $(this).find('label').text();
    var song_artist_name = $(this).find('.artist_name').val();
    var song_artist_id = $(this).find('.artist_id').val();
    var song_id = $(this).find('.song_id').val();
    var current_playlist_id = $('#playlist_id').val();
    console.log(song_title);
    console.log(song_artist_name);
    console.log(song_artist_id);
    console.log(song_id);
    console.log(current_playlist_id);

    var saveSongsForPlaylist = function(song_title, song_artist_name, song_artist_id, song_id, current_playlist_id) {
      $.post( '/songs', 
              { song: { title: song_title, 
                        artist_name: song_artist_name,
                        artist_id: song_artist_id,
                        song_id: song_id,
                        playlist_id: current_playlist_id
                      }
              }
            )
      .success(selected_song.parent().remove());
    }
    saveSongsForPlaylist( song_title, 
                          song_artist_name, 
                          song_artist_id, 
                          song_id, 
                          current_playlist_id
                        );
  });
});
