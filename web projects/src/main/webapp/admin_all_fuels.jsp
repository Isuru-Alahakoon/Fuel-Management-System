<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>All Fuel Types | Sri Drive</title>
<style>
    :root {
        --primary: #4361ee;
        --primary-dark: #3a56d4;
        --secondary: #3f37c9;
        --accent: #4895ef;
        --dark: #1a1a2e;
        --light: #f8f9fa;
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
    
    .content {
        width: calc(100vw - 230px);
        margin-left: 230px;
        min-height: calc(100vh - 80px);
        padding: 30px;
        display: flex;
        justify-content: center;
    }
    
    .main {
        width: 100%;
        max-width: 800px;
        margin-top: 30px;
        background: white;
        border-radius: 12px;
        box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);
        padding: 30px;
        animation: fadeIn 0.5s ease;
    }
    
    .main h1 {
        color: var(--dark);
        margin-bottom: 30px;
        font-size: 1.8rem;
        font-weight: 600;
        text-align: center;
    }
    
    .add-btn {
        display: inline-block;
        background-color: var(--primary);
        color: white;
        padding: 10px 20px;
        border-radius: 6px;
        text-decoration: none;
        font-weight: 500;
        margin-bottom: 20px;
        transition: all 0.3s ease;
    }
    
    .add-btn:hover {
        background-color: var(--primary-dark);
        transform: translateY(-2px);
        box-shadow: 0 4px 8px rgba(67, 97, 238, 0.2);
    }
    
    table {
        width: 100%;
        border-collapse: collapse;
        margin-top: 20px;
        box-shadow: 0 2px 10px rgba(0, 0, 0, 0.05);
    }
    
    th, td {
        padding: 15px;
        text-align: center;
        border-bottom: 1px solid #e0e0e0;
    }
    
    th {
        background-color: var(--primary);
        color: white;
        font-weight: 500;
        text-transform: uppercase;
        font-size: 0.85rem;
        letter-spacing: 0.5px;
    }
    
    tr:nth-child(even) {
        background-color: #f9f9f9;
    }
    
    tr:hover {
        background-color: #f1f5fe;
    }
    
    .action {
        display: flex;
        justify-content: center;
        gap: 10px;
    }
    
    button {
        background-color: var(--primary);
        color: white;
        border: none;
        padding: 8px 16px;
        border-radius: 6px;
        cursor: pointer;
        font-weight: 500;
        transition: all 0.3s ease;
        font-size: 0.9rem;
    }
    
    button:hover {
        background-color: var(--primary-dark);
        transform: translateY(-2px);
        box-shadow: 0 4px 8px rgba(67, 97, 238, 0.2);
    }
    
    button.delete {
        background-color: #f87171;
    }
    
    button.delete:hover {
        background-color: #ef4444;
    }
    
    @keyframes fadeIn {
        from { opacity: 0; transform: translateY(10px); }
        to { opacity: 1; transform: translateY(0); }
    }
    
    @media (max-width: 768px) {
        .content {
            width: 100%;
            margin-left: 0;
            padding: 20px;
        }
        
        .action {
            flex-direction: column;
            gap: 5px;
        }
        
        table {
            display: block;
            overflow-x: auto;
        }
    }
</style>
</head>
<body>

    <%@include file = 'admin_sidebar.jsp' %>
    
    <div class="content">
        <div class="main">
            <h1>Fuel Types Management</h1>
            <a href="admin_add_fuelTypes.jsp" class="add-btn">Add New Fuel Type</a>
            <table>
                <thead>
                    <tr>
                        <th>Fuel Type</th>
                        <th>Price per Liter</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="fuels" items="${fuels}">
                    <tr>
                        <td>${fuels.fuel_type}</td>
                        <td>${fuels.fuel_price}</td>
                        <td>
                            <div class="action">
                                <a href="admin_edit_fuelType.jsp?f_id=${fuels.fuel_id}&f_type=${fuels.fuel_type}&f_price=${fuels.fuel_price}">
                                    <button>UPDATE</button>
                                </a>
                                <form action="admin_delete_fuel" method="post">
                                    <input type="hidden" name="f_id" value="${fuels.fuel_id}">
                                    <button type="submit" class="delete">DELETE</button>
                                </form>
                            </div>
                        </td>
                    </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>

</body>
</html>