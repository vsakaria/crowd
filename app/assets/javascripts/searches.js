
$(function() {
  console.log("Success callback handle")
  $("form#search-box").on("ajax:success", function(){
    $( 'div#search-results ul:not(:last-child)' ).remove();

    $('#play_button').click( function() {
        console.log("Click play on MAx own our search event handle");
        var rdio_id = $('.rdio_id').val()
        console.log(rdio_id)
        $('#rdio').rdio().play(rdio_id)
    });

    $('#stop_button').click( function() {
        console.log("Click stop event handle");
        $('#rdio').rdio().stop()
    });
  });
});