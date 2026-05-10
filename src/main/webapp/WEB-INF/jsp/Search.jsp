<!-- Search.jsp -->
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
	<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
		<html>

		<head>
			<title>Search Employee</title>
			<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

			<style>
				body {
					background: linear-gradient(135deg, #fff3d6, #ffffff);
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
				<h2 class="text-center text-warning">Search Portal</h2>

				<form action="/student/searchById" method="post">
					<label>Enter ID</label>
					<input type="text" name="id" class="form-control"><br>
					<button class="btn btn-warning w-100">Search</button>
				</form>
				<form action="/student/searchByName" method="post">
					<label>Enter Name</label>
					<input type="text" name="name" class="form-control"><br>
					<button class="btn btn-warning w-100">Search by Name</button>
				</form>

				<hr>

				ID : ${result.id}<br><br>
				Name : ${result.name}<br><br>
				Department : ${result.dept}<br><br>
				Salary : ${result.salary}<br><br>
				Email : ${result.email}<br><br>
				Course : ${result.course}<br><br>
			</div>

		</body>

		</html>