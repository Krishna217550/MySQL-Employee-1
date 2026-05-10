<!-- delete.jsp -->
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
	<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
		<html>

		<head>
			<title>Delete Employee</title>

			<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

			<style>
				body {
					background: linear-gradient(135deg, #ffdede, #ffffff);
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

			<script>
				function confirmDelete() {
					return confirm("Are you sure want to delete data?");
				}
			</script>

		</head>

		<body>
			<jsp:include page="navbar.jsp"/>
			<div class="box">

				<h2 class="text-center text-danger">Delete Portal</h2>

				<form action="/student/delete" method="post" onsubmit="return confirmDelete()">

					<label>Enter Employee ID</label>
					<input type="text" name="id" class="form-control"><br>

					<button class="btn btn-danger w-100" type="submit">
						Delete
					</button>

				</form>

				<p class="text-success text-center fw-bold">
					${msg}
				</p>

			</div>

		</body>

		</html>