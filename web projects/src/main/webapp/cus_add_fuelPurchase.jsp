<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import = 'model.User' %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Order Fuel</title>
<style>
    body {
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        background-color: #f5f7fa;
        margin: 0;
        padding: 0;
    }
    
    .container {
        width: 100%;
        display: flex;
        justify-content: center;
        align-items: center;
        min-height: calc(100vh - 80px);
        padding: 20px;
    }
    
    .main {
        background: white;
        padding: 40px;
        border-radius: 12px;
        box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
        width: 100%;
        max-width: 500px;
        animation: fadeIn 0.6s ease-out;
    }
    
    @keyframes fadeIn {
        from { opacity: 0; transform: translateY(20px); }
        to { opacity: 1; transform: translateY(0); }
    }
    
    .form-title {
        text-align: center;
        margin-bottom: 30px;
        color: #2c3e50;
        font-size: 24px;
        position: relative;
    }
    
    .form-title:after {
        content: '';
        display: block;
        width: 60px;
        height: 3px;
        background: #3498db;
        margin: 10px auto 0;
    }
    
    label {
        display: block;
        font-weight: 500;
        margin: 15px 0 8px;
        color: #2c3e50;
    }
    
    select, input[type="text"] {
        width: 100%;
        padding: 12px 15px;
        margin-bottom: 15px;
        border: 1px solid #ddd;
        border-radius: 6px;
        font-size: 16px;
        transition: all 0.3s;
    }
    
    select:focus, input[type="text"]:focus {
        border-color: #3498db;
        box-shadow: 0 0 0 3px rgba(52, 152, 219, 0.2);
        outline: none;
    }
    
    button[type="submit"] {
        width: 100%;
        padding: 14px;
        background: linear-gradient(135deg, #f39c12, #e67e22);
        color: white;
        border: none;
        border-radius: 6px;
        font-size: 16px;
        font-weight: 600;
        cursor: pointer;
        transition: all 0.3s;
        margin-top: 20px;
        letter-spacing: 0.5px;
    }
    
    button[type="submit"]:hover {
        background: linear-gradient(135deg, #e67e22, #f39c12);
        transform: translateY(-2px);
        box-shadow: 0 5px 15px rgba(230, 126, 34, 0.4);
    }
    
    button[type="submit"]:active {
        transform: translateY(0);
    }
    
    .fuel-icon {
        text-align: center;
        font-size: 2.5rem;
        margin-bottom: 20px;
        color: #f39c12;
    }
</style>
</head>
<body>

    <%@include file = 'header.jsp' %>
    
    <% User user = (User)session.getAttribute("user"); %>
    
    <div class="container">
        <div class="main">
            <div class="fuel-icon">⛽</div>
            <h2 class="form-title">Order Fuel</h2>
            <form action="cus_add_fuelPurchase" method="post">
                <label>Select Station</label>
                <select name="station">
                    <c:forEach var="stations" items="${stations}">
                        <option value="${stations.station_id}">${stations.station_name}</option>
                    </c:forEach>
                </select>
                
                <label>Select Fuel Type</label>
                <select name="f_type">
                    <c:forEach var="fuels" items="${fuels}">
                        <option value="${fuels.fuel_id}">${fuels.fuel_type}</option>
                    </c:forEach>
                </select>
                
                <input type="hidden" name="userid" value="<%=user.getUser_id() %>">
                
                <label>Fuel Amount (Liters)</label>
                <input type="text" name="amount" required placeholder="Enter amount in liters">
                
                <label>Payment Method</label>
                <select name="pay_method">
                    <option value="cash">Cash</option>
                    <option value="card">Card</option>
                </select>
                
                <button type="submit">ORDER FUEL</button>
            </form>
        </div>
    </div>

</body>
</html>