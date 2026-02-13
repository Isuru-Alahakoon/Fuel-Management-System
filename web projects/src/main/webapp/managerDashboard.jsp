<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import = "model.User" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Manager Dashboard</title>
</head>

    <style>
        .content{
            background-color: #f5f7fa;
            width:calc(100vw - 230px);
            margin-left:230px;
            position: absolute;
            min-height: 100vh;
            padding: 30px;
        }
        
        .dashboard-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 30px;
        }
        
        .welcome-card {
            background: linear-gradient(135deg, #3498db, #2c3e50);
            color: white;
            padding: 25px;
            border-radius: 10px;
            box-shadow: 0 5px 15px rgba(0,0,0,0.1);
            animation: fadeIn 0.8s ease;
        }
        
        .stats-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 20px;
            margin: 30px 0;
        }
        
        .stat-card {
            background: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 5px 15px rgba(0,0,0,0.05);
            transition: all 0.3s ease;
            text-align: center;
        }
        
        .stat-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 25px rgba(0,0,0,0.1);
        }
        
        .stat-value {
            font-size: 2.5rem;
            font-weight: 700;
            color: #3498db;
            margin: 10px 0;
        }
        
        .stat-label {
            color: #7f8c8d;
            font-size: 1rem;
        }
        
        .recent-activity {
            background: white;
            padding: 25px;
            border-radius: 10px;
            box-shadow: 0 5px 15px rgba(0,0,0,0.05);
            margin-top: 30px;
        }
        
        .activity-item {
            padding: 15px 0;
            border-bottom: 1px solid #eee;
            display: flex;
            align-items: center;
        }
        
        .activity-icon {
            width: 40px;
            height: 40px;
            background: #f1f5f9;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            margin-right: 15px;
            color: #3498db;
        }
        
        .quick-actions {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(150px, 1fr));
            gap: 15px;
            margin: 30px 0;
        }
        
        .action-btn {
            background: white;
            border: none;
            padding: 15px;
            border-radius: 8px;
            box-shadow: 0 5px 15px rgba(0,0,0,0.05);
            cursor: pointer;
            transition: all 0.3s ease;
            text-align: center;
        }
        
        .action-btn:hover {
            background: #3498db;
            color: white;
            transform: translateY(-3px);
        }
        
        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }
    </style>

<body>

    <%User user = (User)session.getAttribute("user"); %>
    <%@include file = "managersidebar.jsp" %>
    
    <div class="content">
        <div class="dashboard-header">
            <h1>Manager Dashboard</h1>
            <div class="welcome-card">
                <h2>Welcome back, <%= user.getName() %>!</h2>
                <p>Here's what's happening with your station today</p>
            </div>
        </div>
        
        <div class="stats-grid">
            <div class="stat-card">
                <div class="stat-value">1,248</div>
                <div class="stat-label">Total Services</div>
            </div>
            <div class="stat-card">
                <div class="stat-value">568</div>
                <div class="stat-label">Fuel Orders</div>
            </div>
            <div class="stat-card">
                <div class="stat-value">$12,845</div>
                <div class="stat-label">This Month Revenue</div>
            </div>
            <div class="stat-card">
                <div class="stat-value">94%</div>
                <div class="stat-label">Customer Satisfaction</div>
            </div>
        </div>
        
        <div class="quick-actions">
            <button class="action-btn">⛽ Add Fuel Stock</button>
            <button class="action-btn">🔧 Manage Services</button>
            <button class="action-btn">👥 View Attendants</button>
            <button class="action-btn">📊 Generate Report</button>
        </div>
        
        <div class="recent-activity">
            <h2>Recent Activity</h2>
            <div class="activity-item">
                <div class="activity-icon">⛽</div>
                <div>
                    <p>Fuel stock updated - Premium 95 added (5000L)</p>
                    <small>Today, 10:45 AM</small>
                </div>
            </div>
            <div class="activity-item">
                <div class="activity-icon">🔧</div>
                <div>
                    <p>New service request - Vehicle #VH2023567</p>
                    <small>Today, 9:30 AM</small>
                </div>
            </div>
            <div class="activity-item">
                <div class="activity-icon">💰</div>
                <div>
                    <p>Payment received - $245.50 (Service #SRV7854)</p>
                    <small>Yesterday, 4:15 PM</small>
                </div>
            </div>
            <div class="activity-item">
                <div class="activity-icon">👥</div>
                <div>
                    <p>New attendant added - John Smith</p>
                    <small>Yesterday, 2:00 PM</small>
                </div>
            </div>
        </div>
    </div>
</body>
</html>