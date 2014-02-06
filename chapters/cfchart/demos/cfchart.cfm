<cfset records = new DAO().getDataForCfmlVersion()>
<cfset seriesColours = ["Green","Yellow","Purple"]>
<cfset seriesColour = 1>
<cfchart chartwidth="500" chartheight="375" seriesplacement="stacked" format="html">
	<cfloop query="records" group="item">
		<cfchartseries type="Bar" label="#item#" seriescolor="#seriesColours[seriesColour++]#">
			<cfloop>
				<cfchartdata item="#day#" value="#total#">
			</cfloop>
		</cfchartseries>
	</cfloop>
</cfchart>