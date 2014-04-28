$(document).ready(function(){
    //INITIALISATION
    initSlideDeckView();

    //EVENT HANDLER FOR CHOOSING A SLIDE DECK
    $(".decks").click( function(e) {    
        //THIS IS THE DECK THAT WE WANT RETURNING
        var selected_deck = $(this).prop("id");
        //OBTAIN ALL THE SLIDES IN THE SELECTED DECK
        processSlides(selected_deck);
    });

    function initSlideDeckView(){
        $("#slide_decks_view").show();
        $("#close_slide_deck").hide();
        $(".fallback-message").hide();
        $("#slides_view").hide();
        $(".hint").hide();
    }
    function initSlideView(){
        $("#slide_decks_view").hide();
        $("#close_slide_deck").show();
        $(".fallback-message").hide();
        $("#slides_view").show();
        $(".hint").show();
    }
    function processSlides(strSelectedDeck){
        //THIS IS THE url STRING THAT IS USED BY ajax
        var strURL = '';
        //THIS IS THE CFC THAT WE WANT TO CALL
        var strCFC = 'cfc/content.cfc?'; 
        //THIS IS THE CFC METHOD THAT WE WANT TO CALL
        var strMethod = 'srcSlideDeck';
        //BUILD THE AJAX STRING
        strURL += strCFC;
        strURL += 'method=' + strMethod;
        strURL += '&slide_deck_id=' + strSelectedDeck; 
        //console.log('strURL = ' + strURL);
        $.ajax({
            url: strURL,
            dataType: 'html',
            success: function(response){
                console.log(response);
                //LOAD THE CSS WE NEED FOR THE SLIDE DECK
                var href = 'css/slide_deck_' + strSelectedDeck + '.css';
                var cssLink = $("<link rel='stylesheet' type='text/css' href='" + href + "'>");
                $("head").append(cssLink); 
                //INSERT THE <div>'s INTO THE PAGE
                $("#impress").html(response);
                //SHOW OR HIDE WHAT WE NEED
                initSlideView();
                //INITIALISE THE SLIDE DECK
                impress().init();
            },
            error: function(ErrorMsg){
                console.log('Error');
            }
        })
    }
});
