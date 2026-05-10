<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
<style>
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
    .user-greeting {
        font-weight: bold;
        color: #4f46e5;
    }
</style>
<nav class="navbar navbar-expand-lg navbar-custom sticky-top">
    <div class="container">
        <a class="navbar-brand" href="/student/"><i class="fas fa-users-cog me-2"></i>MyEmployee</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item"><a class="nav-link" href="/student/">Home</a></li>
                <sec:authorize access="hasRole('ROLE_ADMIN')">
                    <li class="nav-item"><a class="nav-link" href="/student/add">Add</a></li>
                    <li class="nav-item"><a class="nav-link" href="/student/update">Update</a></li>
                    <li class="nav-item"><a class="nav-link" href="/student/delete">Delete</a></li>
                </sec:authorize>
                <li class="nav-item"><a class="nav-link" href="/student/search">Search</a></li>
                <li class="nav-item"><a class="nav-link" href="/student/viewAll">View All</a></li>
            </ul>
            <ul class="navbar-nav">
                <sec:authorize access="!isAuthenticated()">
                    <li class="nav-item"><a class="nav-link" href="/student/login"><i class="fas fa-sign-in-alt me-1"></i>Login</a></li>
                    <li class="nav-item"><a class="nav-link" href="/student/register"><i class="fas fa-user-plus me-1"></i>Register</a></li>
                </sec:authorize>
                <sec:authorize access="isAuthenticated()">
                    <li class="nav-item d-flex align-items-center">
                        <span class="nav-link user-greeting mb-0"><i class="fas fa-user-circle me-1"></i>Welcome, <sec:authentication property="name"/>!</span>
                    </li>
                    <li class="nav-item"><a class="nav-link text-danger" href="/logout"><i class="fas fa-sign-out-alt me-1"></i>Logout</a></li>
                </sec:authorize>
            </ul>
        </div>
    </div>
</nav>
