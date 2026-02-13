<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = 'model.User' %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Customer Profile</title>
</head>
<body>

    <%@include file = 'header.jsp' %>

    <%
        User user = (User)session.getAttribute("user");
    %>

<style>
    body {
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        background-color: #f8f9fa;
        color: #333;
        line-height: 1.6;
        padding: 0;
        margin: 0;
    }

    .profile-container {
        max-width: 1000px;
        margin: 30px auto;
        padding: 0 20px;
    }

    .user-info {
        background: white;
        padding: 25px;
        border-radius: 8px;
        box-shadow: 0 4px 12px rgba(0, 0, 0, 0.08);
        margin-bottom: 30px;
        animation: fadeIn 0.6s ease-out;
    }

    @keyframes fadeIn {
        from { opacity: 0; transform: translateY(20px); }
        to { opacity: 1; transform: translateY(0); }
    }

    .user-info h3 {
        margin: 10px 0;
        padding: 8px 0;
        color: #2c3e50;
        border-bottom: 1px solid #eee;
        font-weight: 500;
    }

    .section-title {
        color: #2c3e50;
        margin: 25px 0 15px;
        font-size: 24px;
        position: relative;
    }

    .section-title:after {
        content: '';
        display: block;
        width: 50px;
        height: 3px;
        background: #3498db;
        margin-top: 8px;
    }

    .add-vehicle-btn {
        background: linear-gradient(135deg, #27ae60, #2ecc71);
        color: white;
        border: none;
        padding: 12px 20px;
        border-radius: 5px;
        font-size: 16px;
        font-weight: 500;
        cursor: pointer;
        transition: all 0.3s;
        margin-bottom: 20px;
        text-decoration: none;
        display: inline-block;
    }

    .add-vehicle-btn:hover {
        background: linear-gradient(135deg, #2ecc71, #27ae60);
        transform: translateY(-2px);
        box-shadow: 0 5px 15px rgba(46, 204, 113, 0.3);
    }

    table {
        width: 100%;
        border-collapse: collapse;
        margin: 20px 0;
        box-shadow: 0 2px 15px rgba(0, 0, 0, 0.1);
        animation: fadeIn 0.8s ease-out;
    }

    th, td {
        padding: 12px 15px;
        text-align: left;
        border-bottom: 1px solid #ddd;
    }

    th {
        background-color: #3498db;
        color: white;
        font-weight: 500;
    }

    tr:nth-child(even) {
        background-color: #f8f9fa;
    }

    tr:hover {
        background-color: #f1f1f1;
    }

    .action-btn {
        padding: 8px 15px;
        border: none;
        border-radius: 4px;
        font-size: 14px;
        cursor: pointer;
        transition: all 0.2s;
        margin: 2px;
    }

    .edit-btn {
        background: #3498db;
        color: white;
        text-decoration: none;
        display: inline-block;
    }

    .edit-btn:hover {
        background: #2980b9;
        transform: translateY(-1px);
    }

    .delete-btn {
        background: #e74c3c;
        color: white;
    }

    .delete-btn:hover {
        background: #c0392b;
        transform: translateY(-1px);
    }

    .action-cell {
        display: flex;
        gap: 10px;
    }

    @media (max-width: 768px) {
        table {
            display: block;
            overflow-x: auto;
        }
        
        .action-cell {
            flex-direction: column;
            gap: 5px;
        }
    }
</style>

    <div class="profile-container">
        <div class="user-info">
            <h3>NIC: <%=user.getNic()%></h3>
            <h3>Name: <%=user.getName() %></h3>
            <h3>Email: <%=user.getEmail() %></h3>
            <h3>Mobile: <%=user.getMobile() %></h3>
        </div>
        
        <h1 class="section-title">Vehicle Details</h1>
        
        <a href="cus_add_vehicle.jsp" class="add-vehicle-btn">Add Vehicle</a>
        
        <table>
            <tr>
                <th>Brand</th>
                <th>Make</th>
                <th>Chasis Number</th>
                <th>Type</th>
                <th>Action</th>
            </tr>
            <c:forEach var="vehicle" items="${vehicle}">
            <tr>
                <td>${vehicle.brand}</td>
                <td>${vehicle.make}</td>
                <td>${vehicle.chasis_no}</td>
                <td>${vehicle.type}</td>
                <td class="action-cell">
                    <a href="cus_vehicle_edit.jsp?vehicleID=${vehicle.vehicle_id}&brand=${vehicle.brand}&make=${vehicle.make}&chasis_no=${vehicle.chasis_no}&v_type=${vehicle.type}" 
                       class="action-btn edit-btn">EDIT</a>
                    
                    <form action="cus_delete_vehicle" method="post" style="display: inline;">
                        <input type="hidden" name="vehicle_id" value="${vehicle.vehicle_id}">
                        <button type="submit" class="action-btn delete-btn">DELETE</button>
                    </form>
                </td>
            </tr>
            </c:forEach>
        </table>
    </div>

</body>
</html>