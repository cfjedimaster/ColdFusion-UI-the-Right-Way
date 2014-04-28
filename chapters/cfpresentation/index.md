CFPRESENTATION
===
The `<cfpresentation>` tag lets you present stuff.

So here I am going to use [impress.js](http://bartaz.github.io/impress.js/#/bored) to do the presentations.

I have included the **original** [impress.js](http://bartaz.github.io/impress.js/#/bored) demonstration so that the code comments for ALL the code are included.

We shall begin.

When the index page loads we run the following CFML :-

    <cfset objContent = createObject("component", "cfc.content") />
    <cfset qryDecks = objContent.srcSlideDecks() />

This obtains our Slide Deck data.

Now we just loop over the Slide Deck data and create some buttons.

![Buttons](images/buttons.png)

First we have index.cfm 

**Listing 1 : index.cfm**

    <cfsetting showdebugoutput="false">
    <!--- CREATE THE CFC OBJECT --->
    <cfset objContent = createObject("component", "cfc.content") />
    <!--- OBTAIN THE SLIDE DECKS --->
    <cfset qryDecks = objContent.srcSlideDecks() />
    <!doctype html>
    <html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=1024" />
        <title>CFPRESENTATION - ALTERNATIVE USING impress.js</title>
        <link rel="stylesheet" href="css/custom.css">
    </head>
    <cfoutput>
    <body class="impress-not-supported">
        <!--- INITIALLLY THIS IS THE ONLY <div> THAT IS VISIBLE --->
        <div id="slide_decks_view">
            <ul id="slide-deck-buttons">
                <cfloop query="qryDecks">
                    <li>
                        <button id="#qryDecks.deck_id#" class="decks">#qryDecks.name#</button>
                    </li>
                </cfloop>
            </ul>
        </div>
        <!--- INITIALLLY THIS <div> IS HIDDEN --->
        <div class="fallback-message">
            <p>Your browser <b>doesn't support the features required.</b></p> 
            <p>by impress.js, so you are presented with a simplified version of this presentation.</p>
            <p>For the best experience please use the latest <b>Chrome</b>, <b>Safari</b> or <b>Firefox</b> browser.</p>
        </div>
        <!--- INITIALLLY THIS <div> IS HIDDEN --->
        <div id="slides_view" class="slides-view">
            <div id="impress"></div>
        </div>
        <!--- INITIALLLY THIS <div> IS HIDDEN --->
        <div class="hint">
            <p>Use the spacebar or arrow keys to navigate</p>
        </div>
    </body>
    </cfoutput>
    <footer>
        <script src="js/hint.js"></script>
        <script src="js/jquery-2.1.0.min.js"></script>
        <script src="js/impress.js"></script>
        <script src="js/main.js"></script>
    </footer>
    </html>

A tiny bit of CSS :-

**Listing 2 : custom.css**

    ul#slide-deck-buttons li {
        list-style-type: none;
    }

The CFC contains 3 **functions**.

The first is used by the index.cfm page to return the slide deck data.

The second returns the data of one particular slide.

The third one processes any particular slide deck and builds a **collection** of  `<div>` items that will be output on the index.cfm page.

**Listing 3 : content.cfc**

    <cfcomponent>
        <!--- LOAD THE DATA --->
        <cfinclude template="data.cfm">
        
        <!--- GET THE SLIDE DECK DATA --->
        <cffunction name="srcSlideDecks" access="public" returntype="query">
            <cfquery name="qrySlideDecks" dbtype="query">
                SELECT *
                FROM tblSlideDecks
            </cfquery>
            <cfreturn qrySlideDecks />
        </cffunction>
        
        <!--- GET THE SLIDE DATA OF A PARTICULAR SLIDE --->
        <cffunction name="srcSlides" access="public" returntype="query">
            <cfargument name="deck_id" required="true" default="1">
            <cfquery name="qrySlides" dbtype="query">
                SELECT *
                FROM tblSlides
                WHERE deck_id = #ARGUMENTS.deck_id#
            </cfquery>
            <cfreturn qrySlides />
        </cffunction>
        
        <!--- BUILD THE SLIDE DECK --->
        <cffunction name="srcSlideDeck" access="remote" returntype="string" returnformat="plain">
            <cfargument name="slide_deck_id" required="true">
            <cfset strDeck = ''>
            <cfset strDiv  = ''>
            <!--- FIRST WE OBTAIN ALL THE SLIDES RELATING TO THE SLIDE DECK CHOSEN --->
            <cfset qrySlides = srcSlides(deck_id=ARGUMENTS.slide_deck_id) />
            <!--- NOW WE LOOP OVER EACH SLIDE AND BUILD THE <div> FOR IT --->
            <cfloop query="qrySlides">
                <cfset strDiv  = ''>
                <cfset strDiv = strDiv & '<div'>
                <cfif qrySlides.i_id NEQ 'null'>
                    <cfset strDiv = strDiv & ' id="' & qrySlides.i_id & '"'>
                </cfif>
                <cfset strDiv = strDiv & ' class="'  & qrySlides.i_class & '"'>
                <cfset strDiv = strDiv & ' data-x="' & qrySlides.i_data_x & '"'>
                <cfset strDiv = strDiv & ' data-y="' & qrySlides.i_data_y & '"'>
                <cfif qrySlides.i_data_z NEQ 'null'>
                    <cfset strDiv = strDiv & ' data-z="' & qrySlides.i_data_z & '"'>
                </cfif>
                <cfif qrySlides.i_data_rotate_x NEQ 'null'>
                    <cfset strDiv = strDiv & ' data-rotate-x="' & qrySlides.i_data_rotate_x & '"'>
                </cfif>
                <cfif qrySlides.i_data_rotate_y NEQ 'null'>
                    <cfset strDiv = strDiv & ' data-rotate-y="' & qrySlides.i_data_rotate_y & '"'>
                </cfif>
                <cfif qrySlides.i_data_rotate_z NEQ 'null'>
                    <cfset strDiv = strDiv & ' data-rotate-z="' & qrySlides.i_data_rotate_z & '"'>
                </cfif>
                <cfif qrySlides.i_data_scale NEQ 'null'>
                    <cfset strDiv = strDiv & ' data-scale="' & qrySlides.i_data_scale & '"'>
                </cfif>
                <cfset strDiv = strDiv & '>'>
                <cfset strDiv = strDiv & qrySlides.i_content>
                <cfset strDiv = strDiv & '</div>'>
                <cfset strDeck = strDeck & strDiv>
            </cfloop>
            <cfreturn strDeck />
        </cffunction>
    </cfcomponent>

When a button is clicked, it triggers an ajax call that builds a **collection** of `<div>` elements associated with the slide deck that has been selected.

**Listing 4 : main.js**

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

In the **processSlides** function we build a **collection** of `<div>` elements by calling the **srcSlideDeck** function in the CFC.

The ajax url will look like this :-

    cfc/content.cfc?method=srcSlideDeck&slide_deck_id=1

When we get a response we have to do **4** things :-

Add the correct **CSS** file to the DOM.

    <link rel="stylesheet" type="text/css" href="css/slide_deck_1.css">

Add the slide deck to the DOM.
    
    $("#impress").html(response);

Change the page view ( From the "Buttons View" to the "Slide View" )

    initSlideView();

Initialise impress.js

    impress().init();

That's it really.

For further information you can reference :-

* [impress.js](http://bartaz.github.io/impress.js/)
