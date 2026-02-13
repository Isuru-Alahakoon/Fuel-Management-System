<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Manager Register</title>
</head>
<body>

    <%@include file = 'header.jsp' %>

<style>
    body {
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        background-color: #f5f7fa;
        color: #333;
        line-height: 1.6;
        margin: 0;
        padding: 0;
    }

    .register-container {
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

    .register-title {
        text-align: center;
        margin-bottom: 25px;
        color: #2c3e50;
        font-size: 24px;
        position: relative;
    }

    .register-title:after {
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

    input[type="text"],
    input[type="email"],
    input[type="password"] {
        width: 100%;
        padding: 12px 15px;
        margin-bottom: 15px;
        border: 1px solid #ddd;
        border-radius: 5px;
        font-size: 16px;
        transition: all 0.3s;
    }

    input:focus {
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
        border-radius: 5px;
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

    @media (max-width: 600px) {
        .register-container {
            margin: 20px 15px;
            padding: 20px;
        }
    }
</style>

    <div class="register-container">
        <h2 class="register-title">Manager Registration</h2>
        <form action="manager_register" method="post">
            <label>NIC</label>
            <input type="text" name="nic" required placeholder="Enter your NIC number">
            
            <label>Name</label>
            <input type="text" name="name" required placeholder="Enter your full name">
            
            <label>Email</label>
            <input type="email" name="email" required placeholder="Enter your email address">
            
            <label>Password</label>
            <input type="password" name="pass" required placeholder="Create a password">
            
            <label>Phone</label>
            <input type="text" name="mobile" required placeholder="Enter your phone number">
            
            <input type="hidden" name="user_type" value="manager">
            
            <button type="submit">REGISTER</button>
        </form>
    </div>

</body>
</html>