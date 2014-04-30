
<cfcomponent>
    <!--- LOAD THE DATA --->
    <cfinclude template="data.cfm">
    <!--- GET THE SLIDE DECK DATA --->
    <cffunction name="srcFeeds" access="public" returntype="query">
        <cfset var qryFeeds = ''>
        <cfquery name="qryFeeds" dbtype="query">
            SELECT *
            FROM tblFeeds
        </cfquery>
        <cfreturn qryFeeds />
    </cffunction>
</cfcomponent>

