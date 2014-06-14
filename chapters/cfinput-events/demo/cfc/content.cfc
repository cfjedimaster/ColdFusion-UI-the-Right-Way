<cfcomponent>
    <cfinclude template="data.cfm">
    <cffunction name="srcData" access="public" returntype="query">
        <cfset var qrySlideDecks = ''>
        <cfquery name="qryData" dbtype="query">
            SELECT *
            FROM tblData
        </cfquery>
        <cfreturn qryData />
    </cffunction>
</cfcomponent>

