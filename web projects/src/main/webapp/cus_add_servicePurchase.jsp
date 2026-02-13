<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import = 'model.User' %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Book Service</title>
</head>
<body>

    <%@include file = "header.jsp" %>
    
    <%
        User user = (User)session.getAttribute("user");
    %>

<style>
    body {
        background-color: #f5f7fa;
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        color: #333;
        line-height: 1.6;
    }

    .container {
        max-width: 800px;
        margin: 40px auto;
        padding: 0 20px;
    }

    .main {
        background: white;
        padding: 30px;
        border-radius: 10px;
        box-shadow: 0 5px 20px rgba(0, 0, 0, 0.1);
        animation: fadeIn 0.6s ease-out;
    }

    @keyframes fadeIn {
        from { opacity: 0; transform: translateY(20px); }
        to { opacity: 1; transform: translateY(0); }
    }

    form {
        display: flex;
        flex-direction: column;
    }

    label {
        font-weight: 500;
        margin: 15px 0 5px;
        color: #2c3e50;
        font-size: 16px;
    }

    select, textarea {
        width: 100%;
        padding: 12px 15px;
        margin-bottom: 15px;
        border: 1px solid #ddd;
        border-radius: 5px;
        font-size: 16px;
        transition: all 0.3s;
    }

    select:focus, textarea:focus {
        border-color: #3498db;
        box-shadow: 0 0 0 3px rgba(52, 152, 219, 0.2);
        outline: none;
    }

    textarea {
        min-height: 120px;
        resize: vertical;
    }

    button {
        background: linear-gradient(135deg, #3498db, #2980b9);
        color: white;
        border: none;
        padding: 14px;
        border-radius: 5px;
        font-size: 16px;
        font-weight: 600;
        cursor: pointer;
        transition: all 0.3s;
        margin-top: 10px;
        letter-spacing: 0.5px;
    }

    button:hover {
        background: linear-gradient(135deg, #2980b9, #3498db);
        transform: translateY(-2px);
        box-shadow: 0 5px 15px rgba(41, 128, 185, 0.4);
    }

    button:active {
        transform: translateY(0);
    }

    .form-title {
        text-align: center;
        margin-bottom: 25px;
        color: #2c3e50;
        font-size: 24px;
    }

    @media (max-width: 600px) {
        .container {
            padding: 0 15px;
        }
        .main {
            padding: 20px;
        }
    }
</style>

    <div class="container">
        <div class="main">
            <h2 class="form-title">Book Your Service</h2>
            <form action="cus_add_servicePurchase" method="post">
                <label>Select Station</label>
                <select name="station">
                    <c:forEach var="stations" items="${stations}">
                    <option value="${stations.station_id}">${stations.station_name}</option>
                    </c:forEach>
                </select>
                
                <input type="hidden" name="userid" value="<%=user.getUser_id() %>">
                
                <label>Select Your Vehicle</label>
                <select name="v_make">
                    <c:forEach var="vehicles" items="${vehicles}">
                    <option value="${vehicles.vehicle_id}">${vehicles.make}</option>
                    </c:forEach>
                </select>
                
                <label>Service Description</label>
                <textarea rows="5" cols="30" name="description" placeholder="Describe the service you need..."></textarea>
                
                <label>Select Payment Method</label>
                <select name="pay_method">
                    <option value="card">Card</option>
                    <option value="cash">Cash</option>
                </select>
                
                <button type="submit">Book Service</button>
            </form>
        </div>
    </div>

</body>
</html>