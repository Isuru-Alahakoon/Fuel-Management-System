<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Attendants</title>
</head>

    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f5f7fa;
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        
        .container {
            width: calc(100vw - 230px);
            margin-left: 230px;
            padding: 30px;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
        }
        
        form {
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
        
        input[type="text"],
        input[type="password"],
        select {
            width: 100%;
            padding: 12px 15px;
            margin-bottom: 15px;
            border: 1px solid #ddd;
            border-radius: 6px;
            font-size: 16px;
            transition: all 0.3s;
        }
        
        input[type="text"]:focus,
        input[type="password"]:focus,
        select:focus {
            border-color: #3498db;
            box-shadow: 0 0 0 3px rgba(52, 152, 219, 0.2);
            outline: none;
        }
        
        button {
            width: 100%;
            padding: 14px;
            background: linear-gradient(135deg, #9b59b6, #8e44ad);
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
        
        button:hover {
            background: linear-gradient(135deg, #8e44ad, #9b59b6);
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(142, 68, 173, 0.4);
        }
        
        button:active {
            transform: translateY(0);
        }
        
        .attendant-icon {
            text-align: center;
            font-size: 2.5rem;
            margin-bottom: 15px;
            color: #9b59b6;
        }
    </style>

<body>

    <%@include file = 'managersidebar.jsp' %>
    
    <div class="container">
        <form action="manager_add_attendant" method="post">
            <h2 class="form-title">Add New Attendant</h2>
            
            <label>NIC</label>
            <input type="text" name="nic" required placeholder="Enter NIC number">
            
            <label>Name</label>
            <input type="text" name="name" required placeholder="Enter full name">
            
            <label>Email</label>
            <input type="text" name="email" required placeholder="Enter email address">
            
            <label>Password</label>
            <input type="password" name="pass" required placeholder="Create password">
            
            <label>Mobile</label>
            <input type="text" name="mobile" required placeholder="Enter mobile number">
            
            <label>Select Station</label>
            <select name="station">
                <c:forEach var="station" items="${station}">
                    <option value="${station.station_id}">${station.station_name}</option>
                </c:forEach>
            </select>
            
            <input type="hidden" name="type" value="attendant">
            
            <button type="submit">SAVE ATTENDANT</button>
        </form>
    </div>

</body>
</html>