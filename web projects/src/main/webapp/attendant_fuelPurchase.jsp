<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Fuel Sales</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<style>
    * {
        box-sizing: border-box;
        margin: 0;
        padding: 0;
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    }
    
    body {
        background-color: #f5f7fa;
    }
    
    .content {
        width: calc(100% - 230px);
        margin-left: 230px;
        display: flex;
        justify-content: center;
        padding: 30px;
    }
    
    .main {
        width: 100%;
        max-width: 1200px;
        animation: fadeIn 0.6s ease-out;
    }
    
    @keyframes fadeIn {
        from { opacity: 0; transform: translateY(20px); }
        to { opacity: 1; transform: translateY(0); }
    }
    
    .add-btn {
        background: linear-gradient(135deg, #27ae60, #2ecc71);
        color: white;
        border: none;
        padding: 12px 25px;
        border-radius: 6px;
        font-size: 16px;
        font-weight: 500;
        cursor: pointer;
        transition: all 0.3s;
        margin-bottom: 25px;
        box-shadow: 0 4px 12px rgba(39, 174, 96, 0.2);
        display: inline-block;
        text-decoration: none;
    }
    
    .add-btn:hover {
        background: linear-gradient(135deg, #2ecc71, #27ae60);
        transform: translateY(-2px);
        box-shadow: 0 6px 16px rgba(39, 174, 96, 0.3);
    }
    
    .table-container {
        width: 100%;
        overflow-x: auto;
        background: white;
        border-radius: 10px;
        box-shadow: 0 5px 25px rgba(0, 0, 0, 0.05);
        padding: 5px;
    }
    
    table {
        width: 100%;
        border-collapse: collapse;
        min-width: 900px;
    }
    
    th {
        background: linear-gradient(135deg, #3498db, #2980b9);
        color: white;
        padding: 15px;
        font-weight: 500;
        text-align: center;
        position: sticky;
        top: 0;
    }
    
    td {
        padding: 12px 15px;
        border-bottom: 1px solid #eee;
        color: #555;
        text-align: center;
    }
    
    tr:nth-child(even) {
        background-color: #f9f9f9;
    }
    
    tr:hover {
        background-color: #f1f5f9;
    }
    
    .price {
        color: #27ae60;
        font-weight: 500;
    }
    
    .fuel-icon {
        color: #f39c12;
        margin-right: 5px;
    }
    
    @media (max-width: 992px) {
        .content {
            width: 100%;
            margin-left: 0;
            padding: 20px;
        }
        
        th, td {
            padding: 10px 8px;
            font-size: 14px;
        }
    }
    
    @media (max-width: 768px) {
        .content {
            padding: 15px;
        }
        
        .add-btn {
            width: 100%;
            text-align: center;
        }
    }
</style>
</head>
<body>

    <%@include file = 'attendant_sidebar.jsp' %>
    
    <div class="content">
        <div class="main">
            
            <div class="table-container">
                <table>
                    <tr>
                        <th>Fuel Type</th>
                        <th>Customer Name</th>
                        <th>Customer Mobile</th>
                        <th>Amount (Liters)</th>
                        <th>Price</th>
                        <th>Payment Method</th>
                        
                    </tr>
                    
                    <c:forEach var="fp" items="${fp}">
                    <tr>
                        <td><span class="fuel-icon"></span> ${fp.fuel_type}</td>
                        <td>${fp.uname}</td>
                        <td>${fp.uMobile}</td>
                        <td>${fp.amount} L</td>
                        <td class="price">LKR ${fp.price}</td>
                        <td>${fp.pay_method}</td>
                        
                    </tr>
                    </c:forEach>
                </table>
            </div>
        </div>
    </div>

</body>
</html>