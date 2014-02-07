<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<meta http-equiv="X-UA-Compatible" content="IE=Edge" />

	<title>CFDiv to jQuery Example</title>

	<link href="//netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap.min.css" rel="stylesheet" />
	<script src="http://code.jquery.com/jquery-2.1.0.min.js"></script>
</head>

<body>
	<div class="navbar navbar-default navbar-static-top" role="navigation">
		<div class="container">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="/">CFDiv to jQuery Example</a>
			</div>
		</div>
	</div>

	<div id="wrap">
		<div class="container">
			<div id="content">
				<h1>jQuery Example 2</h1>
				<div id="exampleContents">
					<h2 id="fullName"></h2>

					<section class="well">
						<h3>Corporate Info</h3>

						<strong>Employee ID</strong> <span id="employeeId"></span><br />
						<strong>Department:</strong> <span id="department"></span><br />
						<strong>Supervisor:</strong> <span id="supervisorName"></span><br />
					</section>

					<section class="well">
						<h3>Contact Info</h3>

						<strong>Phone:</strong> <span id="phone"></span><br />
						<strong>Email:</strong> <span id="email"></span><br />
					</section>
				</div>
			</div>
		</div>
	</div>

	<script type="text/javascript">
		$(document).ready(function() {
			$.ajax({
				url: "/dao.cfc?method=getEmployeeData",
				method: "GET"
			}).done(function(data) {
				$("#fullName").html(data.FIRSTNAME + " " + data.LASTNAME);
				$("#employeeId").html(data.EMPLOYEEID);
				$("#department").html(data.DEPARTMENT);
				$("#supervisorName").html(data.SUPERVISORNAME);
				$("#phone").html(data.CONTACTINFO.PHONE);
				$("#email").html(data.CONTACTINFO.EMAIL);
			});
		});
	</script>
</body>
</html>