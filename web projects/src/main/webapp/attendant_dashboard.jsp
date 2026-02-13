<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import = "model.User" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Attendant Dashboard</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<style>
    body {
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        margin: 0;
        padding: 0;
        background-color: #f5f7fa;
        overflow-x: hidden;
    }
    
    .content {
        width: calc(100% - 230px);
        margin-left: 230px;
        padding: 20px;
        min-height: 100vh;
        box-sizing: border-box;
    }
    
    .welcome-card {
        background: linear-gradient(135deg, #3498db, #2980b9);
        color: white;
        padding: 20px;
        border-radius: 10px;
        box-shadow: 0 5px 15px rgba(0,0,0,0.1);
        margin-bottom: 20px;
        animation: fadeIn 0.8s ease;
    }
    
    @keyframes fadeIn {
        from { opacity: 0; transform: translateY(20px); }
        to { opacity: 1; transform: translateY(0); }
    }
    
    .welcome-card h3 {
        font-size: 1.5rem;
        margin-bottom: 8px;
    }
    
    .welcome-card p {
        font-size: 1rem;
        opacity: 0.9;
    }
    
    .stats-container {
        display: grid;
        grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
        gap: 15px;
        margin-bottom: 20px;
    }
    
    .stat-card {
        background: white;
        padding: 15px;
        border-radius: 8px;
        box-shadow: 0 3px 10px rgba(0,0,0,0.05);
        transition: all 0.3s ease;
    }
    
    .stat-card:hover {
        transform: translateY(-3px);
        box-shadow: 0 5px 15px rgba(0,0,0,0.1);
    }
    
    .stat-title {
        color: #7f8c8d;
        font-size: 0.9rem;
        margin-bottom: 8px;
    }
    
    .stat-value {
        font-size: 1.5rem;
        font-weight: 700;
        color: #2c3e50;
    }
    
    .quick-actions {
        display: grid;
        grid-template-columns: repeat(auto-fit, minmax(150px, 1fr));
        gap: 10px;
        margin: 20px 0;
    }
    
    .action-btn {
        background: white;
        border: none;
        padding: 12px;
        border-radius: 6px;
        box-shadow: 0 3px 10px rgba(0,0,0,0.05);
        cursor: pointer;
        transition: all 0.3s ease;
        text-align: center;
        font-weight: 500;
        font-size: 14px;
    }
    
    .action-btn:hover {
        background: #3498db;
        color: white;
        transform: translateY(-2px);
    }
    
    .recent-activity {
        background: white;
        padding: 20px;
        border-radius: 10px;
        box-shadow: 0 3px 10px rgba(0,0,0,0.05);
        margin-bottom: 20px;
    }
    
    .activity-title {
        font-size: 1.3rem;
        color: #2c3e50;
        margin-bottom: 15px;
        padding-bottom: 8px;
        border-bottom: 1px solid #eee;
    }
    
    .activity-item {
        display: flex;
        align-items: center;
        padding: 12px 0;
        border-bottom: 1px solid #f1f1f1;
    }
    
    .activity-icon {
        width: 35px;
        height: 35px;
        background: #f1f5f9;
        border-radius: 50%;
        display: flex;
        align-items: center;
        justify-content: center;
        margin-right: 12px;
        color: #3498db;
        font-size: 1rem;
    }
    
    @media (max-width: 992px) {
        .content {
            width: 100%;
            margin-left: 0;
            padding: 15px;
        }
        
        .stats-container {
            grid-template-columns: repeat(2, 1fr);
        }
    }
    
    @media (max-width: 768px) {
        .welcome-card {
            padding: 15px;
        }
        
        .welcome-card h3 {
            font-size: 1.3rem;
        }
        
        .stats-container {
            grid-template-columns: 1fr;
        }
        
        .quick-actions {
            grid-template-columns: repeat(2, 1fr);
        }
        
        .activity-item {
            flex-direction: column;
            align-items: flex-start;
        }
        
        .activity-icon {
            margin-bottom: 8px;
        }
    }
    
    @media (max-width: 480px) {
        .content {
            padding: 10px;
        }
        
        .quick-actions {
            grid-template-columns: 1fr;
        }
        
        .action-btn {
            padding: 10px;
        }
    }
</style>
</head>
<body>
    
    <%User user = (User)session.getAttribute("user"); %>
    <%@include file = "attendant_sidebar.jsp" %>
    
    <div class="content">
        <div class="welcome-card">
            <h3>Welcome back, <%=user.getName() %>!</h3>
            <p>Here's what's happening at your station today</p>
        </div>
        
        <div class="stats-container">
            <div class="stat-card">
                <div class="stat-title">Today's Services</div>
                <div class="stat-value">12</div>
            </div>
            <div class="stat-card">
                <div class="stat-title">Fuel Sales (Liters)</div>
                <div class="stat-value">245</div>
            </div>
            <div class="stat-card">
                <div class="stat-title">Pending Tasks</div>
                <div class="stat-value">3</div>
            </div>
        </div>
        
        <div class="quick-actions">
            <button class="action-btn">⛽ Record Fuel Sale</button>
            <button class="action-btn">🔧 Log Service</button>
            <button class="action-btn">📊 View Reports</button>
            <button class="action-btn">📦 Check Stock</button>
        </div>
        
        <div class="recent-activity">
            <h3 class="activity-title">Recent Activity</h3>
            <div class="activity-item">
                <div class="activity-icon">⛽</div>
                <div>
                    <p>Recorded fuel sale - Premium 95 (20L)</p>
                    <small>Today, 10:30 AM</small>
                </div>
            </div>
            <div class="activity-item">
                <div class="activity-icon">🔧</div>
                <div>
                    <p>Completed oil change service</p>
                    <small>Today, 9:15 AM</small>
                </div>
            </div>
            <div class="activity-item">
                <div class="activity-icon">📦</div>
                <div>
                    <p>Updated fuel stock levels</p>
                    <small>Yesterday, 4:45 PM</small>
                </div>
            </div>
        </div>
    </div>

</body>
</html>