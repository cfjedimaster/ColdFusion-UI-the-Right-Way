<cfset tblFeeds=queryNew(
    "id,site,feed",
    "integer,varchar,varchar",
[
    {   
        id:1,
        site:'Coldfusion Examples',
        feed:'http://coldfusionexamples.com/feed/'
    }
    ,
    {   
        id:2,
        site:'DHTML Examples',
        feed:'http://dhtmlexamples.com/feed/'
    }
])>

