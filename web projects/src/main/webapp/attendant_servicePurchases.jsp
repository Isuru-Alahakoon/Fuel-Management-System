<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Attendant Service Purchase</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<style>
    body {
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        background-color: #f5f7fa;
        margin: 0;
        padding: 0;
    }
    
    .content {
        width: calc(100% - 230px);
        margin-left: 230px;
        display: flex;
        justify-content: center;
        padding: 20px;
        box-sizing: border-box;
    }
    
    .main {
        margin-top: 20px;
        width: 100%;
        max-width: 1300px;
        animation: fadeIn 0.6s ease-out;
    }
    
    @keyframes fadeIn {
        from { opacity: 0; transform: translateY(20px); }
        to { opacity: 1; transform: translateY(0); }
    }
    
    .add-service-btn {
        background: linear-gradient(135deg, #27ae60, #2ecc71);
        color: white;
        border: none;
        padding: 12px 20px;
        border-radius: 6px;
        font-size: 16px;
        font-weight: 500;
        cursor: pointer;
        transition: all 0.3s;
        margin-bottom: 20px;
        text-decoration: none;
        display: inline-block;
        box-shadow: 0 4px 12px rgba(39, 174, 96, 0.2);
    }
    
    .add-service-btn:hover {
        background: linear-gradient(135deg, #2ecc71, #27ae60);
        transform: translateY(-2px);
        box-shadow: 0 6px 16px rgba(39, 174, 96, 0.3);
    }
    
    .table-container {
        width: 100%;
        overflow-x: auto;
        -webkit-overflow-scrolling: touch;
    }
    
    table {
        width: 100%;
        min-width: 900px;
        border-collapse: collapse;
        background: white;
        box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);
        border-radius: 10px;
    }
    
    th {
        background: linear-gradient(135deg, #3498db, #2980b9);
        color: white;
        padding: 12px 8px;
        font-weight: 500;
        text-align: center;
        position: sticky;
        top: 0;
        font-size: 14px;
    }
    
    td {
        padding: 10px 8px;
        border-bottom: 1px solid #eee;
        color: #555;
        text-align: center;
        font-size: 13px;
    }
    
    tr:nth-child(even) {
        background-color: #f9f9f9;
    }
    
    tr:hover {
        background-color: #f1f5f9;
    }
    
    .action-cell {
        display: flex;
        flex-direction: column;
        gap: 8px;
        align-items: center;
    }
    
    .edit, .del {
        border: none;
        padding: 6px 12px;
        border-radius: 4px;
        font-size: 13px;
        cursor: pointer;
        transition: all 0.3s;
        width: 70px;
        text-decoration: none;
    }
    
    .edit {
        background: linear-gradient(135deg, #3498db, #2980b9);
        color: white;
    }
    
    .del {
        background: linear-gradient(135deg, #e74c3c, #c0392b);
        color: white;
    }
    
    .edit:hover {
        background: linear-gradient(135deg, #2980b9, #3498db);
        transform: translateY(-2px);
    }
    
    .del:hover {
        background: linear-gradient(135deg, #c0392b, #e74c3c);
        transform: translateY(-2px);
    }
    
    form {
        margin: 0;
    }
    
    .status-pending {
        color: #e67e22;
        font-weight: 500;
    }
    
    .status-completed {
        color: #27ae60;
        font-weight: 500;
    }
    
    /* Responsive adjustments */
    @media (max-width: 992px) {
        .content {
            width: 100%;
            margin-left: 0;
            padding: 15px;
        }
        
        .main {
            margin-top: 10px;
        }
        
        .add-service-btn {
            padding: 10px 15px;
            font-size: 14px;
        }
        
        th, td {
            padding: 8px 5px;
            font-size: 12px;
        }
        
        .edit, .del {
            padding: 5px 8px;
            font-size: 12px;
            width: 60px;
        }
    }
    
    @media (max-width: 768px) {
        .content {
            padding: 10px;
        }
        
        table {
            min-width: 100%;
        }
        
        .action-cell {
            flex-direction: row;
            justify-content: center;
            gap: 5px;
        }
    }
    
    @media (max-width: 576px) {
        .add-service-btn {
            width: 100%;
            text-align: center;
        }
        
        th, td {
            padding: 6px 3px;
            font-size: 11px;
        }
    }
</style>
</head>
<body>
    <%@include file = "attendant_sidebar.jsp" %>
    
    <div class="content">
        <div class="main">
            <a href="attendant_add_service.jsp?station_id=${sessionScope.station_id}" class="add-service-btn">＋ Add Service</a>
            
            <div class="table-container">
                <table>
                    <tr>
                        <th>Customer Name</th>
                        <th>Customer Mobile</th>
                        <th>Manual Name</th>
                        <th>Manual Mobile</th>
                        <th>Vehicle</th>
                        <th>Description</th>
                        <th>Price</th>
                        <th>Payment</th>
                        <th>Status</th>
                        <th>Date</th>
                        <th>Actions</th>
                    </tr>
                    <c:forEach var="service" items="${service}">
                    <tr>
                        <td>${service.auto_user_name}</td>
                        <td>${service.auto_user_mobile}</td>
                        <td>${service.manual_cusName}</td>
                        <td>${service.cus_mobile}</td>
                        <td>${service.vehicle_name}</td>
                        <td>${service.description}</td>
                        <td>${service.price}</td>
                        <td>${service.pay_method}</td>
                        <td>${service.status}</td>
                        <td>${service.dateTime}</td>
                        <td class="action-cell">
                            <a href="attendant_edit_service.jsp?s_purchase_id=${service.s_purchase_id}&description=${service.description}&price=${service.price}&payMethod=${service.pay_method}&status=${service.status}&dateTime=${service.dateTime}">
                                <button class="edit">EDIT</button>
                            </a>
                            
                            <form action="attendant_delete_service" method="post">
                                <input type="hidden" name="sp_id" value="${service.s_purchase_id}">
                                <button class="del">DEL</button>
                            </form>
                        </td>
                    </tr>
                    </c:forEach>
                </table>
            </div>
        </div>
    </div>
</body>
</html>