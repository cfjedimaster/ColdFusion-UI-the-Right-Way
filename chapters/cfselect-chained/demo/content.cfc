<cfcomponent>
    <!--- CONTINENT DATA --->
    <cfset tblContinent = queryNew("name,id", "varchar,varchar", [
        {name:"Africa",id:"AF"},
        {name:"Europe",id:"EU"},
        {name:"North America",id:"NA"}
    ])>
    <!--- COUNTRY DATA --->
    <cfset tblCountry = queryNew("name,code,continent_id", "varchar,varchar,varchar", [
        {name:"Cameroon",code:"CMR",continent_id:"AF"},
        {name:"Eritrea",code:"ERI",continent_id:"AF"},
        {name:"Ghana",code:"GHA",continent_id:"AF"},
        {name:"United Kingdom",code:"GBR",continent_id:"EU"},
        {name:"Iceland",code:"ISL",continent_id:"EU"},
        {name:"Latvia",code:"LVA",continent_id:"EU"},
        {name:"Bahamas",code:"BMU",continent_id:"NA"},
        {name:"Panama",code:"PAN",continent_id:"NA"},
        {name:"United States",code:"USA",continent_id:"NA"}
    ])>
    <!--- CITY DATA --->
    <cfset tblCity = queryNew("name,code", "varchar,varchar", [
        {name:"Hamilton",code:"BMU"},
        {name:"Saint George",code:"BMU"},
        {name:"Bamenda",code:"CMR"},
        {name:"Garoua",code:"CMR"},
        {name:"Maroua",code:"CMR"},
        {name:"Asmara",code:"ERI"},
        {name:"Blackburn",code:"GBR"},
        {name:"London",code:"GBR"},
        {name:"Preston",code:"GBR"},
        {name:"Accra",code:"GHA"},
        {name:"Kumasi",code:"GHA"},
        {name:"Tamale",code:"GHA"},
        {name:"Reykjavik",code:"ISL"},
        {name:"Daugavpils",code:"LVA"},
        {name:"Riga",code:"LVA"},
        {name:"Ciudad de Panama",code:"PAN"},
        {name:"San Miguelito",code:"PAN"},
        {name:"Chattanooga",code:"USA"},
        {name:"Lafayette",code:"USA"},
        {name:"New York",code:"USA"}
    ])>

    <cffunction name="getContent" access="remote" returntype="query" output="true">
        <cfargument name="strTableName" type="string" required="true">
        <cfargument name="strID" type="string" required="true">
        <cfargument name="strName" type="string" required="true">
        <cfargument name="intDistinct" type="numeric" required="false" default="0">
        <cfargument name="selectedCol" type="string" required="false" default="0">
        <cfargument name="selectedID" type="string" required="false" default="0">
        <cfquery name="qryContent" dbtype="query">
            select
            <cfif arguments.intDistinct eq 1>distinct</cfif>
            #arguments.strID# as theID,
            #arguments.strName# as theValue
            from #arguments.strTableName#
            <cfif arguments.selectedID neq 0>
              where #arguments.selectedCol# = '#arguments.selectedID#'
            </cfif>
            order by #arguments.strName#
        </cfquery>
        <cfreturn qryContent />
    </cffunction>
</cfcomponent>