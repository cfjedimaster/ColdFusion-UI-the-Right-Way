<cfif IsDefined("submitMainForm")>
	<cfdump var="#FORM#">
</cfif>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<title>CFMESSAGEBOX Alternative</title>
    <link rel="stylesheet" href="css/custom.css">
	<script src="//code.jquery.com/jquery-1.9.1.js"></script>
	<script src="js/jquery.modal.min.js"></script>
	<script src="js/main.js"></script>
</head>
<cfoutput>
<body>
	<form name="mainForm" action="index.cfm" method="post">
		<ul>
			<li>
				<button name="showNameForm" id="showNameForm">Enter your name</button>
			</li>
			<li>
				<span id="message"></span>
			</li>
			<li>
				<button type="submit" name="submitMainForm" id="submitMainForm">Submit the form</button>
			</li>
		</ul>
		<!--- THESE TWO VARIABLES ARE CHANGE BY THE JS THAT RUNS WHEN submitName IS CLICKED  --->
		<input type="hidden" name="firstName" id="firstName" value="">
		<input type="hidden" name="lastName" id="lastName" value="">
	</form>

	<!--- NOTE THIS FORM IS HIDDEN --->
	<form class="login_form modal" id="nameForm" style="display:none;">
		<h3>Please enter your name</h3>
		<p>
			<label>Firstname:</label>
			<input type="text" name="txtFirstname" id="txtFirstname" />
		</p>
		<p>
			<label>Lastname:</label>
			<input type="text" name="txtLastname" id="txtLastname" type="text" />
		</p>
		<p>
			<input type="button" id="submitName" value="Submit" />
		</p>
	</form>
</body>
</cfoutput>
<footer>
</footer>
</html>

