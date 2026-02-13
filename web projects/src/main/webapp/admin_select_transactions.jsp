<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Purchases and Transactions | Sri Drive</title>
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
        min-height: 100vh;
        padding: 30px;
    }
    
    .filter-form {
        background: white;
        border-radius: 12px;
        box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);
        padding: 30px;
        margin-bottom: 30px;
        animation: fadeIn 0.5s ease;
    }
    
    .filter-form h1 {
        color: var(--dark);
        font-size: 1.8rem;
        margin-bottom: 25px;
    }
    
    .form-row {
        display: flex;
        flex-wrap: wrap;
        gap: 20px;
        margin-bottom: 20px;
        align-items: center;
    }
    
    .form-group {
        display: flex;
        flex-direction: column;
        gap: 8px;
        flex: 1;
        min-width: 250px;
    }
    
    label {
        font-weight: 500;
        color: var(--dark);
        font-size: 0.95rem;
    }
    
    select {
        padding: 12px 15px;
        border: 1px solid #ddd;
        border-radius: 6px;
        font-size: 1rem;
        transition: all 0.3s ease;
        background-color: white;
        cursor: pointer;
    }
    
    select:focus {
        outline: none;
        border-color: var(--primary);
        box-shadow: 0 0 0 2px rgba(67, 97, 238, 0.2);
    }
    
    button {
        background-color: var(--primary);
        color: white;
        border: none;
        padding: 12px 25px;
        border-radius: 6px;
        cursor: pointer;
        font-weight: 500;
        transition: all 0.3s ease;
        font-size: 1rem;
    }
    
    button:hover {
        background-color: var(--primary-dark);
        transform: translateY(-2px);
        box-shadow: 0 4px 8px rgba(67, 97, 238, 0.2);
    }
    
    hr {
        border: 0;
        height: 1px;
        background-color: #e0e0e0;
        margin: 30px 0;
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
        
        .form-row {
            flex-direction: column;
            gap: 15px;
        }
        
        .form-group {
            width: 100%;
        }
    }
</style>
</head>
<body>

    <%@include file = "admin_sidebar.jsp" %>
    
    <div class="container">
        <div class="filter-form">
            <h1>Purchases and Transactions</h1>
            <form action="admin_all_transactions" method="post">
                <div class="form-row">
                    <div class="form-group">
                        <label>Select Station</label>
                        <select name="station_id">
                            <c:forEach var="stations" items="${stations}">
                                <option value="${stations.station_id}">${stations.station_name}</option>
                            </c:forEach>
                        </select>
                    </div>
                    
                    <div class="form-group">
                        <label>Select Purchase Type</label>
                        <select name="purchase">
                            <option value="service">All Service Purchases</option>
                            <option value="fuel">All Fuel Purchases</option>
                        </select>
                    </div>
                </div>
                
                <button type="submit" id="select">VIEW TRANSACTIONS</button>
            </form>
        </div>
        <hr>
        <!-- Transaction results will appear below -->
    </div>

</body>
</html>