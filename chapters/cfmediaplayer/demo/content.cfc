
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
