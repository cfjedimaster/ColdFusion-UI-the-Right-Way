<cfsetting showdebugoutput="false">
<!--- CREATE THE CFC OBJECT --->
<cfset objContent = createObject("component", "cfc.content") />
<!--- OBTAIN THE FEEDS --->
<cfset qryFeeds = objContent.srcFeeds() />
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=1024" />
    <title>CFPOD - ALTERNATIVE USING impress.js</title>
    <link rel="stylesheet" href="css/custom.css">
</head>
<cfoutput>
<body>
    <ul id="feeds" style="display:table;">
        <cfloop query="qryFeeds">
            <cffeed action="read" source="#qryFeeds.feed#" query="rssFeed" />
            <div class="title">#qryFeeds.site#</div>
            <li id="feed_#qryFeeds.id#" class="feedlist">
                <ul class="innerlist">
                    <cfloop query="rssFeed">
                        <li>
                            [#dateFormat(rssFeed.publishedDate)#] <a href="#rssFeed.rssLink#">#rssFeed.title#</a>
                        </li>
                    </cfloop>
                </ul>
            </li>
        </cfloop>
    </ul>
</body>
</cfoutput>
</html>

