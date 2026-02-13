<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Vehicle</title>
</head>
<body>

    <%
        String vehicelID = request.getParameter("vehicleID");
        String brand = request.getParameter("brand");
        String make = request.getParameter("make");
        String chasis_no = request.getParameter("chasis_no");
        String v_type = request.getParameter("v_type");
    %>
    
    <%@include file = 'header.jsp' %>

<style>
    body {
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        background-color: #f8f9fa;
        color: #333;
        line-height: 1.6;
        margin: 0;
        padding: 0;
    }

    .edit-container {
        max-width: 500px;
        margin: 40px auto;
        padding: 30px;
        background: white;
        border-radius: 10px;
        box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
        animation: fadeIn 0.6s ease-out;
    }

    @keyframes fadeIn {
        from { opacity: 0; transform: translateY(20px); }
        to { opacity: 1; transform: translateY(0); }
    }

    .edit-title {
        text-align: center;
        margin-bottom: 25px;
        color: #2c3e50;
        font-size: 24px;
        position: relative;
    }

    .edit-title:after {
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
        margin: 15px 0 5px;
        color: #2c3e50;
    }

    input[type="text"] {
        width: 100%;
        padding: 12px 15px;
        margin-bottom: 15px;
        border: 1px solid #ddd;
        border-radius: 5px;
        font-size: 16px;
        transition: all 0.3s;
    }

    input[type="text"]:focus {
        border-color: #3498db;
        box-shadow: 0 0 0 3px rgba(52, 152, 219, 0.2);
        outline: none;
    }

    button {
        width: 100%;
        padding: 14px;
        background: linear-gradient(135deg, #f39c12, #e67e22);
        color: white;
        border: none;
        border-radius: 5px;
        font-size: 16px;
        font-weight: 600;
        cursor: pointer;
        transition: all 0.3s;
        margin-top: 20px;
        letter-spacing: 0.5px;
    }

    button:hover {
        background: linear-gradient(135deg, #e67e22, #f39c12);
        transform: translateY(-2px);
        box-shadow: 0 5px 15px rgba(230, 126, 34, 0.4);
    }

    button:active {
        transform: translateY(0);
    }

    @media (max-width: 600px) {
        .edit-container {
            margin: 20px 15px;
            padding: 20px;
        }
    }
</style>

    <div class="edit-container">
        <h2 class="edit-title">Edit Vehicle Details</h2>
        <form action="cus_edit_vehicle" method="post">
        
            <input type="hidden" name="vehicleID" value="<%=vehicelID %>">
        
            <label>Brand</label>
            <input type="text" name="brand" value="<%=brand %>">
            
            <label>Make</label>
            <input type="text" name="make" value="<%=make %>">
            
            <label>Chasis Number</label>
            <input type="text" name="chasis_no" value="<%=chasis_no %>">
            
            <label>Vehicle type</label>
            <input type="text" name="v_type" value="<%=v_type %>">
            
            <button type="submit">UPDATE</button>
        </form>
    </div>

</body>
</html>