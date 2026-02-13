<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Management | Sri Drive</title>
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
    
    .container {
        width: calc(100vw - 230px);
        margin-left: 230px;
        min-height: calc(100vh - 80px);
        padding: 30px;
        display: flex;
        justify-content: center;
    }
    
    .user-table-container {
        width: 100%;
        max-width: 1200px;
        background: white;
        border-radius: 12px;
        box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);
        padding: 30px;
        animation: fadeIn 0.5s ease;
    }
    
    h1 {
        color: var(--dark);
        margin-bottom: 30px;
        font-size: 1.8rem;
        font-weight: 600;
        text-align: center;
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
    
    @keyframes fadeIn {
        from { opacity: 0; transform: translateY(10px); }
        to { opacity: 1; transform: translateY(0); }
    }
    
    @media (max-width: 768px) {
        .container {
            width: 100%;
            margin-left: 0;
            padding: 20px;
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
    <%@include file = 'adminUserButtons.jsp' %>
    
    <div class="container">
        <div class="user-table-container">
            <h1>User Management</h1>
            <table>
                <thead>
                    <tr>
                        <th>NIC</th>
                        <th>Name</th>
                        <th>Email</th>
                        <th>Mobile</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="Users" items="${Users}">
                    <tr>
                        <td>${Users.nic}</td>
                        <td>${Users.name}</td>
                        <td>${Users.email}</td>
                        <td>${Users.mobile}</td>
                        <td>
                            <a href="admin_edit_manager.jsp?managerID=${Users.user_id}&nic=${Users.nic}&name=${Users.name}&email=${Users.email}&mobile=${Users.mobile}">
                                <button>UPDATE</button>
                            </a>
                        </td>
                    </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>

</body>
</html>