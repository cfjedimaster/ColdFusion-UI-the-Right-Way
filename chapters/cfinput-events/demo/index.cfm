<!--- CREATE THE CFC OBJECT --->
<cfset objContent = createObject("component", "cfc.content") />
<!--- OBTAIN THE SLIDE DECKS --->
<cfset qryData = objContent.srcData() />

<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<title>CFINPUT Events Alternatives</title>
    <link rel="stylesheet" href="css/custom.css">
</head>
<cfoutput>
<body>
	<form name="mainForm" action="index.cfm" method="post">
		<ul>
			<li>
				onChange:
			</li>
			<li>
				<input type="text" name="txtOnChange" id="txtOnChange" />
				<span id="msgOnChange" class="msg"></span>
			</li>
			<li>
				onClick:
			</li>
			<li>
                <cfloop query="qryData">
	                <input 	class="txtOnClick"
	                		id="txtOnClick_#qryData.currentrow#" 
	                		name="txtOnClick_#qryData.currentrow#" 
	                		type="button" 
	                		value="#qryData.name#"
	                >
                </cfloop>
				<span id="msgOnClick" class="msg"></span>
			</li>
			<li>
				onKeyDown
			</li>
			<li>
				<input type="text" name="txtOnKeyDown" id="txtOnKeyDown" />
				<span id="msgOnKeyDown" class="msg"></span>
			</li>
			<li>
				onKeyUp
			</li>
			<li>
				<input type="text" name="txtOnKeyUp" id="txtOnKeyUp" />
				<span id="msgOnKeyUp" class="msg"></span>
			</li>
			<li>
				mouseDown, mouseUp
			</li>
			<li>
				<input type="text" name="txtOnMouseDownUp" id="txtOnMouseDownUp" />
				<span id="msgOnMouseDownUp" class="msg"></span>
			</li>
			<li>
				checked ( Radio )
			</li>
			<li>
                <cfloop query="qryData">
	                <input class="radChecked" id="radChecked_#qryData.id#" name="radChecked" type="radio" value="#qryData.name#">#qryData.name#
                </cfloop>
				<span id="msgRadChecked" class="msg"></span>
			</li>
			<li>
				checked ( Checkbox )
			</li>
			<li>
                <cfloop query="qryData">
	                <input class="chkChecked" id="chkChecked_#qryData.id#" name="chkChecked" type="checkbox" value="#qryData.name#">#qryData.name#
                </cfloop>
				<span id="msgChkChecked" class="msg"></span>
			</li>
			<li>
				<button type="submit" name="submitMainForm" id="submitMainForm">Submit the form</button>
			</li>
		</ul>
		<!--- THESE TWO VARIABLES ARE CHANGE BY THE JS THAT RUNS WHEN submitName IS CLICKED  --->
		<input type="hidden" name="firstName" id="firstName" value="">
		<input type="hidden" name="lastName" id="lastName" value="">
	</form>
</body>
</cfoutput>
<footer>
	<script src="js/jquery-2.1.0.min.js"></script>
	<script src="js/main.js"></script>
</footer>
</html>

<cfif IsDefined("submitMainForm")>
	<cfdump var="#FORM#">
</cfif>