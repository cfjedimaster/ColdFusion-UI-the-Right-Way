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


