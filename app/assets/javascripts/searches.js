
$(function() {

  console.log("Success callback handle")

  $("form#search-box").on("ajax:success", function(){

        $( 'div#search-results ul:not(:last-child)' ).remove();

      $('#play_button').click( function() {
          console.log("Click play on MAx own our search event handle");
          $('#rdio').rdio().play('t3561638')
      });

      $('#stop_button').click( function() {
          console.log("Click stop event handle");
          $('#rdio').rdio().stop()
      });
  });

});


//Only play tracj id's