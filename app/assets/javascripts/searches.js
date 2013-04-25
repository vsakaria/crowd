$(function() {
  console.log("Success callback handle");
  $("form#search-box").on("ajax:success", function(){
    $('div#search-results ul:not(:last-child)').remove();

    $('.play-rdio-track').on('click', function(e) {
      e.preventDefault();
      console.log("Click play on MAx own our search event handle");
      var rdio_id = $(this).attr('id');
      $('#rdio').rdio().stop();
      $('#rdio').rdio().play(rdio_id);
      console.log(rdio_id + " should be playing");
    });

    $('.stop-rdio-track').click( function() {
      console.log("Click stop event handle");
      $('#rdio').rdio().stop();
    });
  });
});