<%@ page contentType="text/html;charset=UTF-8" language="java" %>
	<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
		<%@ page import="java.util.*" %>
			<%@ page import="com.example.www.Model.EmployeeModel" %>

				<html>

				<head>
					<title>All Employees</title>
					<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
						rel="stylesheet">
				</head>

				<body>
					<jsp:include page="navbar.jsp"/>
					<div class="container mt-5">

						<h2 class="text-center text-primary">All Employees</h2>
						<br>

						<table class="table table-bordered table-striped text-center">

							<tr class="table-dark">
								<th>ID</th>
								<th>Name</th>
								<th>Course</th>
								<th>Email</th>
								<th>Department</th>
								<th>Salary</th>
							</tr>

							<% List<EmployeeModel> list = (List<EmployeeModel>)request.getAttribute("employees");

									for(EmployeeModel e : list){
									%>

									<tr>
										<td>
											<%= e.getId() %>
										</td>
										<td>
											<%= e.getName() %>
										</td>
										<td>
											<%= e.getCourse() %>
										</td>
										<td>
											<%= e.getEmail() %>
										</td>
										<td>
											<%= e.getDept() %>
										</td>
										<td>
											<%= e.getSalary() %>
										</td>
									</tr>

									<% } %>

						</table>

					</div>

				</body>

				</html>