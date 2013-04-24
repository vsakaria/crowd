 // var artist = @random_artist
function fetchImages(artist) {
    var url = 'http://developer.echonest.com/api/v4/artist/images';

    var args = { 
            format:'json', 
            api_key: 'FHPFXUKUGHZWWUXPR',
            name: artist,
            results: 16, 
    };


    //artist is the argument that takes the input from the form and passes it to the JS

    info("Fetching images for " + artist);
    $.getJSON(url, args,
            function(data) {
                console.log(data);
                $("#results").empty();
                if (! ('images' in data.response)) {
                    error("Can't find any images for " + artist);
                } else {
                    $("#results").show();
                    $.each(data.response.images, function(index, item) {
                        var div = formatItem(index, item);
                        $("#results").append(div);
                    });
                    info("Showing " + data.response.images.length + " of " + data.response.total + " images for " + artist);
                }
            },
            function() {
                error("Trouble getting blog posts for " + artist);
            }
        );
}

function formatItem(which, item) {
    var img = $("<div>");
    img.addClass("image-container");
    img.css("background-image", "url(" +item.url + ")");

    var attribution = $("<span class='label'>")
        .text(item.license.attribution)
        .hide();

    img.append(attribution);
    img.hover( 
        function(evt) {
            img.find('.label').show();
        },
        function(evt) {
            img.find('.label').hide();
        }
    );
    return img;
}


function go() {
    var artist = $.trim($("#artist").val());
    if (artist.length  > 0) {
        fetchImages(artist);
    } else {
        info("Type an artist name first");
    }
}

function info(s) {
    $("#info").removeClass();
    if (s.length > 0) {
        $("#info").addClass("alert alert-info");
    }
    $("#info").text(s);
}

function error(s) {
    $("#info").removeClass();
    if (s.length > 0) {
        $("#info").addClass("alert alert-error");
    }
    $("#info").text(s);
}
    
$(document).ready(function() {
    go();
    $("#artist").change(go);
});