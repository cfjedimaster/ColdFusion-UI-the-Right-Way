CFMEDIAPLAYER
===
The `<cfmediaplayer>` tag lets you play media.

In this demo I am using Shadowbox to play the media.

And I am using JW Player to play the MP4 and MP3 files.

You can download them here [JW Player](http://www.longtailvideo.com/) and here [Shadowbox](http://www.shadowbox-js.com/)

The demo plays YouTube, Vimeo, MP4 and MP3 files.

**Listing 1 : index.cfm**

    <!--- CREATE THE CFC OBJECT --->
    <cfset objContent = createObject("component", "content") />
    <!--- GET THE INITIAL DATA SOURCE --->
    <cfset srcData = objContent.srcData() />
    <!DOCTYPE html>
    <html lang="en">
    <head>
        <meta charset="utf-8">
        <title>CFMEDIAPLAYER Alternative</title>
        <link type="text/css" rel="stylesheet" href="shadowbox-3.0.3/shadowbox.css">
        <link rel="stylesheet" href="css/custom.css">
        <script src="js/jquery-2.1.0.min.js"></script>
        <script type="text/javascript" src="shadowbox-3.0.3/shadowbox.js"></script>
    </head>
    <cfoutput>
    <body>
        <ul>
            <cfloop query="srcData">
                <li>
                    <cfset data = objContent.srcDataAttributes(srcData.id) />
                    <a rel="#data.rel#" href="#data.href#">
                        <img src="#data.imgSrc#" class="media-thumbnail">
                    </a>
                </li>
            </cfloop>
        </ul>
    </body>
    </cfoutput>
    <footer>
        <script>
             Shadowbox.init();
         </script>
    </footer>
    </html>

A bit of CSS :-

**Listing 2 : custom.css**

    ul li {
        display: inline-block;
        list-style-type: none;
        cursor: pointer; cursor: hand;
    }
    .media-thumbnail {
        height: 150px;
        width: 200px;
    }


And then the CFC which does all the donkey work

**Listing 3 : content.cfc**


    <cfcomponent>
        <cfset tblMedia = queryNew("id,media_type,media_id,media_origin,thumb_prefix,thumb_suffix", "integer,integer,varchar,varchar,varchar,varchar", 
        [
            {id:1, media_type:1, media_id:"Rd5kZ7sCszI", media_origin:"http://www.youtube.com/v/", thumb_prefix:"http://img.youtube.com/vi/", thumb_suffix:""},
            {id:2, media_type:1, media_id:"EkFvM5wwKCg", media_origin:"http://www.youtube.com/v/", thumb_prefix:"http://img.youtube.com/vi/", thumb_suffix:""},
            {id:3, media_type:2, media_id:"44405353", media_origin:"http://vimeo.com/moogaloop.swf?clip_id=", thumb_prefix:"http://vimeo.com/", thumb_suffix:".json?callback=showThumb"},
            {id:4, media_type:3, media_id:"DM2.mp4", media_origin:"media/", thumb_prefix:"DM2.jpg", thumb_suffix:""},
            {id:5, media_type:4, media_id:"show_213.mp3", media_origin:"http://traffic.libsyn.com/cfhour/", thumb_prefix:"media/", thumb_suffix:"cfhour1.jpg"}
        ])>
        <!--- GET THE SOURCE DATA --->
        <cffunction name="srcData" access="public" returntype="query">
            <cfquery name="qryData" dbtype="query">
                select id 
                from tblMedia
            </cfquery>
            <cfreturn qryData />
        </cffunction>
        <!--- GET THE ATTRIBUTES DATA --->
        <cffunction name="srcDataAttributes" access="public" returntype="struct">
            <cfargument name="id" type="numeric" required="true">
            <cfset data = structNew()>
            <cfquery name="qrySrcData" dbtype="query">
                select * 
                from tblMedia
                where id = #ARGUMENTS.id#
            </cfquery>
            <cfswitch expression="#qrySrcData.media_type#">
                <cfcase value="1">
                    <cfset data.rel = 'shadowbox;width=640;height=385'>
                    <cfset data.href = qrySrcData.media_origin & qrySrcData.media_id>
                    <cfset data.imgSrc = qrySrcData.thumb_prefix & qrySrcData.media_id & '/1.jpg'>
                </cfcase>
                <cfcase value="2">
                    <cfset vimeothumbnail = getVimeoThumbnail(media_id = qrySrcData.media_id)>
                    <cfset data.rel = 'shadowbox;width=640;height=385'>
                    <cfset data.href = qrySrcData.media_origin & qrySrcData.media_id>
                    <cfset data.imgSrc = vimeothumbnail>
                </cfcase>
                <cfcase value="3">
                    <cfset data.rel = 'shadowbox;width=640;height=385;player=flv'>
                    <cfset data.href = qrySrcData.media_origin & qrySrcData.media_id>
                    <cfset data.imgSrc = qrySrcData.media_origin & qrySrcData.thumb_prefix>
                </cfcase>
                 <cfcase value="4">
                    <cfset data.rel = 'shadowbox;width=640;height=385;player=flv'>
                    <cfset data.href = qrySrcData.media_origin & qrySrcData.media_id>
                    <cfset data.imgSrc = qrySrcData.thumb_prefix & qrySrcData.thumb_suffix>
                </cfcase>
            </cfswitch>        
            <cfreturn data />
        </cffunction>
        <!--- GET THE VIMEO THUMBNAIL --->
        <cffunction name="getVimeoThumbnail" access="public" returntype="string">
            <cfargument name="media_id" type="string" required="true">
            <cfhttp url="http://vimeo.com/api/v2/video/#ARGUMENTS.media_id#.json">
            <cfset theData=REReplace(cfhttp.FileContent,"^\s*[[:word:]]*\s*\(\s*","")>
            <cfset theData=REReplace(theData, "\s*\)\s*$", "")>
            <cfset jsonData=DeserializeJSON(theData)>
            <cfreturn jsonData[1].thumbnail_medium>
        </cffunction>
    </cfcomponent>

Now you need to know that the MP4 and MP3 files are played using the 
player.swf file that reside in :-

shadowbox-3.0.3/libraries/mediaplayer/player.swf

You can get a player from the [longtail](http://www.longtailvideo.com/) site.

When you have downloaded the ZIP from the longtail site then you have to rename the **jwplayer.flash.swf** file to **player.swf** and place it in :-

shadowbox-3.0.3/libraries/mediaplayer/

If you don't place it in that specific directory then the MP4 and MP3 files WILL NOT PLAY.



For further information you can reference :-

* [JW Player](http://www.longtailvideo.com/)
* [Shadowbox](http://www.shadowbox-js.com/)




