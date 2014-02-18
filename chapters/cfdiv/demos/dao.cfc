component {

	remote struct function getEmployeeData() returnformat="json" {
		/*
		 * Ensure we have set our content type header correctly
		 * and return a JSON object.
		 */
		getPageContext().getResponse().setHeader("Content-Type", "text/json");

		return {
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
	}

}