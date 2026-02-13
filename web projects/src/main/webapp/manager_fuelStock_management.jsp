<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Fuel Stock Management</title>
</head>

    <style>
        .container{
            display: flex;
            width: calc(100vw - 230px);
            min-height: 100vh;
            justify-content: center;
            margin-left: 230px;
            background-color: #f5f7fa;
            padding: 30px;
        }
        
        .main {
            width: 100%;
            max-width: 1200px;
        }
        
        .addFuelStockBtn {
            background: linear-gradient(135deg, #27ae60, #2ecc71);
            color: white;
            border: none;
            padding: 12px 25px;
            border-radius: 6px;
            font-size: 16px;
            font-weight: 500;
            cursor: pointer;
            transition: all 0.3s;
            margin-bottom: 30px;
            box-shadow: 0 4px 12px rgba(39, 174, 96, 0.2);
        }
        
        .addFuelStockBtn:hover {
            background: linear-gradient(135deg, #2ecc71, #27ae60);
            transform: translateY(-2px);
            box-shadow: 0 6px 16px rgba(39, 174, 96, 0.3);
        }
        
        table {
            width: 100%;
            border-collapse: collapse;
            background: white;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);
            border-radius: 10px;
            overflow: hidden;
            animation: fadeIn 0.6s ease-out;
        }
        
        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }
        
        th {
            background-color: #3498db;
            color: white;
            padding: 15px;
            text-align: left;
            font-weight: 500;
        }
        
        td {
            padding: 15px;
            border-bottom: 1px solid #eee;
            color: #555;
        }
        
        tr:nth-child(even) {
            background-color: #f9f9f9;
        }
        
        tr:hover {
            background-color: #f1f5f9;
        }
        
        .del_edit {
            display: flex;
            gap: 10px;
        }
        
        .edit_btn {
            background: linear-gradient(135deg, #3498db, #2980b9);
            color: white;
            border: none;
            padding: 8px 15px;
            border-radius: 4px;
            font-size: 14px;
            cursor: pointer;
            transition: all 0.3s;
        }
        
        .edit_btn:hover {
            background: linear-gradient(135deg, #2980b9, #3498db);
            transform: translateY(-2px);
            box-shadow: 0 4px 8px rgba(41, 128, 185, 0.3);
        }
        
        .del_btn {
            background: linear-gradient(135deg, #e74c3c, #c0392b);
            color: white;
            border: none;
            padding: 8px 15px;
            border-radius: 4px;
            font-size: 14px;
            cursor: pointer;
            transition: all 0.3s;
        }
        
        .del_btn:hover {
            background: linear-gradient(135deg, #c0392b, #e74c3c);
            transform: translateY(-2px);
            box-shadow: 0 4px 8px rgba(231, 76, 60, 0.3);
        }
        
        .fuel-amount {
            font-weight: 600;
            color: #2c3e50;
        }
        
        @media (max-width: 768px) {
            .del_edit {
                flex-direction: column;
                gap: 5px;
            }
            
            th, td {
                padding: 10px 8px;
            }
        }
    </style>

<body>

    <%@include file = 'managersidebar.jsp' %>
    
    <div class="container">
        <div class="main">
            <a href="manager_get_fuelTypes">
                <button class="addFuelStockBtn">＋ Add Fuel Stock</button>
            </a>
            <table>
                <tr>
                    <th>Fuel Type</th>
                    <th>Amount (Liters)</th>
                    <th>Actions</th>
                </tr>
                
                <c:forEach var="fs" items="${fs}">
                <tr>
                    <td>${fs.fuel_type}</td>
                    <td class="fuel-amount">${fs.fuel_amount} L</td>
                    <td>
                        <div class="del_edit">
                            <a href="manager_update_fuelStock.jsp?stockid=${fs.stock_id}&fuel_type=${fs.fuel_type}&amount=${fs.fuel_amount}&fuel_id=${fs.fuel_id}">
                                <button class="edit_btn">Update</button>
                            </a>
                            
                            <form action="manager_delete_fuelStock" method="post">
                                <input type="hidden" name="fs_id" value="${fs.stock_id}">
                                <button class="del_btn">Delete</button>
                            </form>
                        </div>
                    </td>
                </tr>
                </c:forEach>
            </table>
        </div>
    </div>

</body>
</html>