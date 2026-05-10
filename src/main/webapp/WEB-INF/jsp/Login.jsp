<!-- Login.jsp -->
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
	<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
		<html>

		<head>
			<title>Login Portal</title>
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
				<h2 class="text-center text-dark">Login Portal</h2>

				<!-- Error handling for Spring Security -->
				<% if(request.getParameter("error") !=null) { %>
					<div class="alert alert-danger text-center">Invalid username or password</div>
					<% } %>

						<form action="/student/login" method="post">

							<label>User ID</label>
							<input type="text" name="username" class="form-control"><br>

							<label>Password</label>
							<input type="password" name="password" class="form-control"><br>

							<label>Role</label>
							<select name="role" class="form-control" required>
								<option value="ROLE_USER">User</option>
								<option value="ROLE_ADMIN">Admin</option>
							</select><br>

							<button class="btn btn-dark w-100" type="submit">Login</button>

							<div class="text-center mt-3">
								New user..?<a href="/student/register">Register</a>
							</div>

						</form>
			</div>

		</body>

		</html>