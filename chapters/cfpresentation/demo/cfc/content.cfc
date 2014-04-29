
<cfcomponent>
    <!--- LOAD THE DATA --->
    <cfinclude template="data.cfm">
    <!--- GET THE SLIDE DECK DATA --->
    <cffunction name="srcSlideDecks" access="public" returntype="query">
        <cfset var qrySlideDecks = ''>
        <cfquery name="qrySlideDecks" dbtype="query">
            SELECT *
            FROM tblSlideDecks
        </cfquery>
        <cfreturn qrySlideDecks />
    </cffunction>
    <!--- GET THE SLIDE DATA OF A PARTICULAR SLIDE --->
    <cffunction name="srcSlides" access="public" returntype="query">
        <cfargument name="deck_id" required="true" default="1">
        <cfset var qrySlides = ''>
        <cfquery name="qrySlides" dbtype="query">
            SELECT *
            FROM tblSlides
            WHERE deck_id = #ARGUMENTS.deck_id#
        </cfquery>
        <cfreturn qrySlides />
    </cffunction>
    <!--- BUILD THE SLIDE DECK --->
    <cffunction name="srcSlideDeck" access="remote" returntype="string" returnformat="plain">
        <cfargument name="slide_deck_id" required="true">
        <cfset var strDeck = ''>
        <cfset var strDiv  = ''>
        <!--- FIRST WE OBTAIN ALL THE SLIDES RELATING TO THE SLIDE DECK CHOSEN --->
        <cfset var qrySlides = srcSlides(deck_id=ARGUMENTS.slide_deck_id) />
        <!--- NOW WE LOOP OVER EACH SLIDE AND BUILD THE <div> FOR IT --->
        <cfloop query="qrySlides">
            <cfset strDiv  = ''>
            <cfset strDiv = strDiv & '<div'>
            <cfif qrySlides.i_id NEQ 'null'>
                <cfset strDiv = strDiv & ' id="' & qrySlides.i_id & '"'>
            </cfif>
            <cfset strDiv = strDiv & ' class="'  & qrySlides.i_class & '"'>
            <cfset strDiv = strDiv & ' data-x="' & qrySlides.i_data_x & '"'>
            <cfset strDiv = strDiv & ' data-y="' & qrySlides.i_data_y & '"'>
            <cfif qrySlides.i_data_z NEQ 'null'>
                <cfset strDiv = strDiv & ' data-z="' & qrySlides.i_data_z & '"'>
            </cfif>
            <cfif qrySlides.i_data_rotate_x NEQ 'null'>
                <cfset strDiv = strDiv & ' data-rotate-x="' & qrySlides.i_data_rotate_x & '"'>
            </cfif>
            <cfif qrySlides.i_data_rotate_y NEQ 'null'>
                <cfset strDiv = strDiv & ' data-rotate-y="' & qrySlides.i_data_rotate_y & '"'>
            </cfif>
            <cfif qrySlides.i_data_rotate_z NEQ 'null'>
                <cfset strDiv = strDiv & ' data-rotate-z="' & qrySlides.i_data_rotate_z & '"'>
            </cfif>
            <cfif qrySlides.i_data_scale NEQ 'null'>
                <cfset strDiv = strDiv & ' data-scale="' & qrySlides.i_data_scale & '"'>
            </cfif>
            <cfset strDiv = strDiv & '>'>
            <cfset strDiv = strDiv & qrySlides.i_content>
            <cfset strDiv = strDiv & '</div>'>
            <cfset strDeck = strDeck & strDiv>
        </cfloop>
        <cfreturn strDeck />
    </cffunction>
</cfcomponent>

