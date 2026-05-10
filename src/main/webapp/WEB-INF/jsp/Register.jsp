<!-- Register.jsp -->
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
	<html>

	<head>
		<title>Register Portal</title>
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

		<style>
			body {
				background: linear-gradient(135deg, #ece0ff, #ffffff);
				font-family: Arial;
			}

			.box {
				width: 450px;
				margin: auto;
				margin-top: 80px;
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
			<h2 class="text-center text-dark">Register Portal</h2>

			<form action="/student/register" method="post">

				<label>User ID</label>
				<input type="text" name="username" class="form-control" required><br>

				<label>Password</label>
				<input type="password" name="password" class="form-control" required><br>

				<label>Role</label>
				<select name="role" class="form-control" required>
					<option value="ROLE_USER">User</option>
					<option value="ROLE_ADMIN">Admin</option>
				</select><br>

				<button class="btn btn-dark w-100" type="submit">Register</button>

				<div class="text-center mt-3">
					Already Registered..?<a href="/student/login">Login</a>
				</div>

			</form>
		</div>

	</body>

	</html>