<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Sidebar | Sri Drive</title>
<style>
    :root {
        --primary: #4361ee;
        --primary-dark: #3a56d4;
        --secondary: #3f37c9;
        --accent: #4895ef;
        --dark: #1a1a2e;
        --light: #f8f9fa;
        --sidebar-bg: #1a1a2e;
        --sidebar-hover: rgba(255, 255, 255, 0.1);
        --sidebar-active: var(--primary);
    }
    
    * {
        margin: 0;
        padding: 0;    
        box-sizing: border-box;
        font-family: 'Inter', -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, sans-serif;
    }
    
    body {
        background-color: #f5f7fa;
    }
    
    .sidebar {
        background-color: var(--sidebar-bg);
        width: 230px;
        height: 100vh;
        position: fixed;
        box-shadow: 2px 0 10px rgba(0, 0, 0, 0.1);
        transition: all 0.3s ease;
        z-index: 1000;
    }
    
    .sidebar ul {
        padding: 20px 0;
    }
    
    .sidebar ul li {
        list-style: none;
        width: 100%;
        margin: 5px 0;
        position: relative;
        transition: all 0.3s ease;
    }
    
    .sidebar ul li a {
        text-decoration: none;
        font-size: 0.95rem;
        color: rgba(255, 255, 255, 0.8);
        transition: all 0.3s ease;
        display: block;
        padding: 12px 20px;
        border-radius: 4px;
        margin: 0 10px;
        font-weight: 500;
    }
    
    .sidebar ul li a:hover {
        color: white;
        background-color: var(--sidebar-hover);
        transform: translateX(5px);
    }
    
    .sidebar ul li a:active {
        transform: scale(0.98);
    }
    
    .sidebar ul li:first-child {
        margin-top: 0;
    }
    
    .sidebar ul li:last-child {
        margin-top: 30px;
        border-top: 1px solid rgba(255, 255, 255, 0.1);
        padding-top: 20px;
    }
    
    .sidebar ul li:last-child a {
        color: #f87171;
    }
    
    .sidebar ul li:last-child a:hover {
        background-color: rgba(248, 113, 113, 0.1);
    }
    
    /* Active link indicator */
    .sidebar ul li.active a {
        color: white;
        background-color: var(--sidebar-active);
    }
    
    .sidebar ul li.active a:hover {
        background-color: var(--primary-dark);
    }
    
    /* Icon styling (if you add icons later) */
    .sidebar ul li a i {
        margin-right: 10px;
        width: 20px;
        text-align: center;
    }
    
    /* Responsive adjustments */
    @media (max-width: 768px) {
        .sidebar {
            width: 70px;
            overflow: hidden;
        }
        
        .sidebar ul li a {
            padding: 12px 15px;
            text-align: center;
        }
        
        .sidebar ul li a span {
            display: none;
        }
        
        .sidebar ul li a i {
            margin-right: 0;
            font-size: 1.2rem;
        }
    }
</style>
</head>
<body>

    <div class="sidebar">
        <ul>
            <li class="active"><a href="adminDashboard.jsp"><i class="fas fa-tachometer-alt"></i> <span>Dashboard</span></a></li>
            <li><a href="#"><i class="fas fa-gas-pump"></i> <span>Station Management</span></a></li>
            <li><a href="admin_get_fuelTypes"><i class="fas fa-oil-can"></i> <span>Fuel Management</span></a></li>
            <li><a href="admin_user_management.jsp"><i class="fas fa-users"></i> <span>User Management</span></a></li>
            <li><a href="admin_get_stations"><i class="fas fa-receipt"></i> <span>Purchase & Transactions</span></a></li>
            <li><a href="#"><i class="fas fa-comment-alt"></i> <span>Feedbacks and Reports</span></a></li>
            <li><a href="#"><i class="fas fa-bell"></i> <span>Notifications</span></a></li>
            <li><a href="#"><i class="fas fa-cog"></i> <span>Settings</span></a></li>
            <li><a href="logout"><i class="fas fa-sign-out-alt"></i> <span>Logout</span></a></li>
        </ul>
    </div>

    <!-- Font Awesome for icons (optional) -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">

</body>
</html>