<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<html>
<head>
    <title>Employee Management System</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <style>
        body {
            background: linear-gradient(135deg, #f3f4f6, #e5e7eb);
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            color: #1f2937;
        }

        .navbar-custom {
            background: rgba(255, 255, 255, 0.9);
            backdrop-filter: blur(10px);
            box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1);
        }

        .navbar-brand {
            font-weight: 800;
            color: #4f46e5 !important;
            font-size: 1.5rem;
        }

        .nav-link {
            font-weight: 500;
            color: #4b5563 !important;
            transition: color 0.3s;
        }

        .nav-link:hover {
            color: #4f46e5 !important;
        }

        .hero-section {
            padding: 80px 0;
            text-align: center;
            background: linear-gradient(135deg, #4f46e5, #7c3aed);
            color: white;
            border-radius: 0 0 30px 30px;
            margin-bottom: 50px;
            box-shadow: 0 10px 15px -3px rgba(0, 0, 0, 0.1);
        }

        .hero-title {
            font-size: 3.5rem;
            font-weight: 800;
            margin-bottom: 20px;
            text-shadow: 2px 2px 4px rgba(0,0,0,0.2);
        }

        .hero-subtitle {
            font-size: 1.2rem;
            opacity: 0.9;
        }

        .card {
            border: none;
            border-radius: 24px;
            box-shadow: 0 10px 25px -5px rgba(0, 0, 0, 0.05);
            transition: all 0.4s cubic-bezier(0.4, 0, 0.2, 1);
            overflow: hidden;
            height: 100%;
            background: #ffffff;
        }

        .card:hover {
            transform: translateY(-12px);
            box-shadow: 0 20px 30px -5px rgba(0, 0, 0, 0.15);
        }

        .card img {
            height: 200px;
            width: 100%;
            object-fit: cover;
            border-bottom: 1px solid #f3f4f6;
        }

        .card-body {
            display: flex;
            flex-direction: column;
            justify-content: space-between;
            padding: 24px;
        }

        .card-title {
            font-weight: 700;
            color: #111827;
            margin-bottom: 12px;
        }

        .card-text {
            color: #6b7280;
            margin-bottom: 20px;
            flex-grow: 1;
        }

        .btn-custom {
            border-radius: 12px;
            padding: 10px 20px;
            font-weight: 600;
            text-transform: uppercase;
            letter-spacing: 0.5px;
            transition: all 0.3s ease;
            width: 100%;
        }

        .btn-add { background: #10b981; color: white; border: none; }
        .btn-add:hover { background: #059669; color: white; }
        
        .btn-search { background: #f59e0b; color: white; border: none; }
        .btn-search:hover { background: #d97706; color: white; }

        .btn-update { background: #3b82f6; color: white; border: none; }
        .btn-update:hover { background: #2563eb; color: white; }

        .btn-delete { background: #ef4444; color: white; border: none; }
        .btn-delete:hover { background: #dc2626; color: white; }

        .btn-view { background: #8b5cf6; color: white; border: none; }
        .btn-view:hover { background: #7c3aed; color: white; }

        .login-box {
            background: white;
            padding: 40px;
            border-radius: 24px;
            text-align: center;
            box-shadow: 0 10px 25px -5px rgba(0, 0, 0, 0.05);
            margin-top: 40px;
        }
        
        .user-greeting {
            font-weight: bold;
            color: #4f46e5;
        }
    </style>
</head>

<body>
    <% if(request.getAttribute("alertMsg") != null) { %>
        <script>
            alert("<%= request.getAttribute("alertMsg") %>");
        </script>
    <% } %>

    <jsp:include page="navbar.jsp"/>

    <div class="hero-section">
        <div class="container">
            <h1 class="hero-title">Employee Management System</h1>
            <p class="hero-subtitle">A modern, secure, and intuitive platform to manage your organization's workforce seamlessly.</p>
        </div>
    </div>

    <div class="container mb-5">
        <div class="row g-4 justify-content-center">
            
            <sec:authorize access="hasRole('ROLE_ADMIN')">
            <!-- Add Employee -->
            <div class="col-md-6 col-lg-4 col-xl-3">
                <div class="card">
                    <img src="https://img.freepik.com/premium-vector/vector-illustration-archives-users-data-with-people-adding-files-large-folders_675567-3449.jpg" alt="Add Employee">
                    <div class="card-body">
                        <div>
                            <h4 class="card-title">Add Employee</h4>
                            <p class="card-text">Create a new employee profile and add them to the system database.</p>
                        </div>
                        <a href="/student/add" class="btn btn-custom btn-add">Open</a>
                    </div>
                </div>
            </div>
            
            <!-- Update Employee -->
            <div class="col-md-6 col-lg-4 col-xl-3">
                <div class="card">
                    <img src="https://img.freepik.com/premium-vector/boy-updating-mobile-software_118167-5676.jpg?w=2000" alt="Update Employee">
                    <div class="card-body">
                        <div>
                            <h4 class="card-title">Update Details</h4>
                            <p class="card-text">Modify and keep existing employee information up-to-date.</p>
                        </div>
                        <a href="/student/update" class="btn btn-custom btn-update">Open</a>
                    </div>
                </div>
            </div>
            
            <!-- Delete Employee -->
            <div class="col-md-6 col-lg-4 col-xl-3">
                <div class="card">
                    <img src="https://img.freepik.com/premium-vector/tiny-woman-deleting-data-smartphone-move-unnecessary-files-trash-bin-delete-concept_501813-1484.jpg?w=1800" alt="Delete Employee">
                    <div class="card-body">
                        <div>
                            <h4 class="card-title">Remove Record</h4>
                            <p class="card-text">Securely delete an employee profile from the active database.</p>
                        </div>
                        <a href="/student/delete" class="btn btn-custom btn-delete">Open</a>
                    </div>
                </div>
            </div>
            </sec:authorize>

            <!-- Search Employee -->
            <div class="col-md-6 col-lg-4 col-xl-3">
                <div class="card">
                    <img src="https://img.freepik.com/premium-vector/data-search-flat-style-design-vector-illustration-stock-illustration_357500-2323.jpg?w=2000" alt="Search Employee">
                    <div class="card-body">
                        <div>
                            <h4 class="card-title">Search Directory</h4>
                            <p class="card-text">Quickly locate an employee by entering their unique ID.</p>
                        </div>
                        <a href="/student/search" class="btn btn-custom btn-search">Open</a>
                    </div>
                </div>
            </div>

            <!-- View All -->
            <div class="col-md-6 col-lg-4 col-xl-3">
                <div class="card">
                    <img src="https://static.vecteezy.com/system/resources/previews/047/783/571/original/an-illustration-shows-a-digital-marketing-analytics-dashboard-with-charts-graphs-and-icons-representing-data-analysis-performance-tracking-and-online-marketing-free-vector.jpg" alt="View All">
                    <div class="card-body">
                        <div>
                            <h4 class="card-title">All Employees</h4>
                            <p class="card-text">View a comprehensive list of all employees in the organization.</p>
                        </div>
                        <a href="/student/viewAll" class="btn btn-custom btn-view">Open</a>
                    </div>
                </div>
            </div>

        </div>

        <sec:authorize access="!isAuthenticated()">
        <div class="row justify-content-center">
            <div class="col-md-8 col-lg-6">
                <div class="login-box">
                    <img src="https://img.freepik.com/premium-vector/login-form-your-account-vector_77760-427.jpg" width="150" alt="Login Portal">
                    <h3 class="mt-4 font-weight-bold">Authentication Required</h3>
                    <p class="text-muted mb-4">Please log in to access the full features of the Employee Management System.</p>
                    <div class="d-flex justify-content-center gap-3">
                        <a href="/student/login" class="btn btn-dark px-5 py-2" style="border-radius: 12px; font-weight: 600;">Login</a>
                        <a href="/student/register" class="btn btn-outline-dark px-5 py-2" style="border-radius: 12px; font-weight: 600;">Register</a>
                    </div>
                </div>
            </div>
        </div>
        </sec:authorize>
    </div>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>