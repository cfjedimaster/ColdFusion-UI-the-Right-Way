
<cfcomponent>
    <!--- LOAD THE DATA --->
    <cfinclude template="data.cfm">
    <!--- GET THE DATA --->
    <cffunction name="srcData" access="public" returntype="query">
        <cfset var qrydata = ''>
        <cfquery name="qrydata" dbtype="query">
            SELECT *
            FROM tblData
        </cfquery>
        <cfreturn qrydata />
    </cffunction>
</cfcomponent>

