<cfcomponent>
    <cffunction name="getInterval" access="remote" returntype="numeric" output="true" returnformat="plain">
        <cfset intRandom = RandRange( 1, 20) />
        <cfreturn intRandom />
    </cffunction>
</cfcomponent>
