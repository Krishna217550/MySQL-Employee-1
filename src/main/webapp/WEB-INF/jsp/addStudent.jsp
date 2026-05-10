<!-- addStudent.jsp -->
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
	<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
		<html>

		<head>
			<title>Add Employee</title>

			<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

			<style>
				body {
					background: linear-gradient(135deg, #dff6e3, #ffffff);
					font-family: Arial;
				}

				.box {
					width: 500px;
					margin: auto;
					margin-top: 60px;
					padding: 35px;
					background: white;
					border-radius: 20px;
					box-shadow: 0 10px 20px rgba(0, 0, 0, 0.08);
				}
			</style>

		</head>

		<body>
			<jsp:include page="navbar.jsp"/>
			<div class="box">

				<h2 class="text-center text-success">Add Employee Portal</h2>

				<form action="/student/save" method="post" onsubmit="showMessage()">

					<label>Name</label>
					<input type="text" name="name" class="form-control"><br>

					<label>Course</label>
					<input type="text" name="course" class="form-control"><br>

					<label>Email</label>
					<input type="email" name="email" class="form-control"><br>

					<label>Department</label>
					<input type="text" name="dept" class="form-control"><br>

					<label>Salary</label>
					<input type="text" name="salary" class="form-control"><br>

					<button type="submit" class="btn btn-success w-100">
						Add Employee
					</button>

				</form>

				<br>

				<p class="text-success text-center fw-bold">
					${msg}
				</p>
			</div>

			<script>
				function showMessage() {
					document.getElementById("msg").innerHTML = "Successfully Added";
				}
			</script>

		</body>

		</html>