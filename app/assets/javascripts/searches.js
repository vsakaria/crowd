
$(function() {

  console.log("Success callback handle")

  $("form#search-box").on("ajax:success", function(){

  $( 'div#search-results ul:not(:last-child)' ).remove();

  });

});