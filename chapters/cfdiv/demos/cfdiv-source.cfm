<cfscript>

	/*
	 * Create a mock data source. This will loosely represent
	 * an employee
	 */
	data = {
		employeeId     = 15609,
		firstName      = "Adam",
		lastName       = "Presley",
		department     = "Engineering",
		supervisorName = "Bob Bobby",
		contactInfo    = {
			phone = "555-556-7009",
			email = "adam@bobbobbyengineering555.zerg"
		}
	};

</cfscript>

<cfoutput>

	<h2>#data.firstName# #data.lastName#</h2>

	<section class="well">
		<h3>Corporate Info</h3>

		<strong>Employee ID</strong> ###data.employeeId#<br />
		<strong>Department:</strong> #data.department#<br />
		<strong>Supervisor:</strong> #data.supervisorName#<br />
	</section>

	<section class="well">
		<h3>Contact Info</h3>

		<strong>Phone:</strong> #data.contactInfo.phone#<br />
		<strong>Email:</strong> #data.contactInfo.email#<br />
	</section>

</cfoutput>