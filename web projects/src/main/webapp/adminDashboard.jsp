<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import = "model.User" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Dashboard | Sri Drive</title>
<style>
    :root {
        --primary: #4361ee;
        --primary-dark: #3a56d4;
        --secondary: #3f37c9;
        --accent: #4895ef;
        --dark: #1a1a2e;
        --light: #f8f9fa;
        --success: #4cc9f0;
        --warning: #f72585;
    }
    
    * {
        box-sizing: border-box;
        margin: 0;
        padding: 0;
        font-family: 'Inter', -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, sans-serif;
    }
    
    body {
        background-color: #f5f7fa;
        color: var(--dark);
    }
    
    .container {
        width: calc(100vw - 230px);
        margin-left: 230px;
        padding: 30px;
        min-height: 100vh;
    }
    
    .welcome-section {
        background: white;
        border-radius: 12px;
        box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);
        padding: 30px;
        margin-bottom: 30px;
        animation: fadeIn 0.5s ease;
    }
    
    .welcome-section h1 {
        color: var(--dark);
        font-size: 2rem;
        margin-bottom: 10px;
    }
    
    .welcome-section p {
        color: #666;
        margin-bottom: 20px;
    }
    
    .stats-grid {
        display: grid;
        grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
        gap: 20px;
        margin-bottom: 30px;
    }
    
    .stat-card {
        background: white;
        border-radius: 12px;
        box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);
        padding: 25px;
        transition: all 0.3s ease;
    }
    
    .stat-card:hover {
        transform: translateY(-5px);
        box-shadow: 0 10px 25px rgba(0, 0, 0, 0.1);
    }
    
    .stat-card h3 {
        color: var(--dark);
        font-size: 1rem;
        margin-bottom: 15px;
        font-weight: 500;
    }
    
    .stat-card .value {
        font-size: 2rem;
        font-weight: 700;
        color: var(--primary);
        margin-bottom: 10px;
    }
    
    .quick-actions {
        display: grid;
        grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
        gap: 20px;
        margin-bottom: 30px;
    }
    
    .action-card {
        background: white;
        border-radius: 12px;
        box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);
        padding: 20px;
        text-align: center;
        transition: all 0.3s ease;
    }
    
    .action-card:hover {
        background: var(--primary);
        color: white;
        transform: translateY(-5px);
    }
    
    .action-card:hover h3 {
        color: white;
    }
    
    .action-card h3 {
        color: var(--dark);
        font-size: 1rem;
        margin-bottom: 15px;
    }
    
    .action-card i {
        font-size: 2rem;
        margin-bottom: 15px;
        color: var(--primary);
    }
    
    .action-card:hover i {
        color: white;
    }
    
    .recent-activity {
        background: white;
        border-radius: 12px;
        box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);
        padding: 30px;
    }
    
    .recent-activity h2 {
        color: var(--dark);
        font-size: 1.5rem;
        margin-bottom: 20px;
    }
    
    @keyframes fadeIn {
        from { opacity: 0; transform: translateY(10px); }
        to { opacity: 1; transform: translateY(0); }
    }
    
    @media (max-width: 768px) {
        .container {
            width: 100%;
            margin-left: 0;
            padding: 20px;
        }
    }
</style>
<!-- Font Awesome for icons -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
</head>
<body>
    
    <%User user = (User)session.getAttribute("user"); %>

    <%@include file = "admin_sidebar.jsp" %>
    
    <div class="container">
        <div class="welcome-section">
            <h1>Welcome back, <%=user.getName() %>!</h1>
            <p>Here's what's happening with your AutoCare Pro system today.</p>
        </div>
        
        <div class="stats-grid">
            <div class="stat-card">
                <h3>Total Stations</h3>
                <div class="value">24</div>
                <p>+2 from last month</p>
            </div>
            <div class="stat-card">
                <h3>Active Managers</h3>
                <div class="value">18</div>
                <p>+3 from last week</p>
            </div>
            <div class="stat-card">
                <h3>Today's Revenue</h3>
                <div class="value">$3,245</div>
                <p>12% increase</p>
            </div>
            <div class="stat-card">
                <h3>Pending Requests</h3>
                <div class="value">7</div>
                <p>Needs attention</p>
            </div>
        </div>
        
        <div class="quick-actions">
            <a href="admin_add_fuelTypes.jsp" class="action-card">
                <i class="fas fa-gas-pump"></i>
                <h3>Add Fuel Type</h3>
            </a>
            <a href="admin_user_management.jsp" class="action-card">
                <i class="fas fa-users"></i>
                <h3>Manage Users</h3>
            </a>
            <a href="#" class="action-card">
                <i class="fas fa-chart-line"></i>
                <h3>View Reports</h3>
            </a>
            <a href="#" class="action-card">
                <i class="fas fa-cog"></i>
                <h3>System Settings</h3>
            </a>
        </div>
        
        <div class="recent-activity">
            <h2>Recent Activity</h2>
            <p>New station registered - Colombo Branch (Yesterday)</p>
            <p>Fuel prices updated - Octane 95 (2 days ago)</p>
            <p>New manager account created - John Doe (3 days ago)</p>
        </div>
    </div>

</body>
</html>