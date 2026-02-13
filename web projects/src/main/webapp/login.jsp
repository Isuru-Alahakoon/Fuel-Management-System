<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login Page</title>
</head>
<body>

<%@include file = 'header.jsp' %>

<style>
    body {
        background-color: #f5f7fa;
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        line-height: 1.6;
        color: #333;
    }

    form {
        max-width: 400px;
        margin: 50px auto;
        padding: 30px;
        background: white;
        border-radius: 10px;
        box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
        animation: fadeIn 0.8s ease-out;
    }

    @keyframes fadeIn {
        from { opacity: 0; transform: translateY(20px); }
        to { opacity: 1; transform: translateY(0); }
    }

    form h2 {
        text-align: center;
        margin-bottom: 25px;
        color: #2c3e50;
        font-size: 28px;
    }

    input[type="text"],
    input[type="password"] {
        width: 100%;
        padding: 12px 15px;
        margin: 10px 0 20px;
        border: 1px solid #ddd;
        border-radius: 5px;
        font-size: 16px;
        transition: all 0.3s;
    }

    input[type="text"]:focus,
    input[type="password"]:focus {
        border-color: #3498db;
        box-shadow: 0 0 0 3px rgba(52, 152, 219, 0.2);
        outline: none;
    }

    label {
        font-weight: 500;
        color: #2c3e50;
    }

    button {
        width: 100%;
        padding: 14px;
        background: linear-gradient(135deg, #3498db, #2980b9);
        color: white;
        border: none;
        border-radius: 5px;
        font-size: 16px;
        font-weight: 600;
        cursor: pointer;
        transition: all 0.3s;
        margin-top: 10px;
        letter-spacing: 0.5px;
    }

    button:hover {
        background: linear-gradient(135deg, #2980b9, #3498db);
        transform: translateY(-2px);
        box-shadow: 0 5px 15px rgba(41, 128, 185, 0.4);
    }

    button:active {
        transform: translateY(0);
    }

    .form-footer {
        text-align: center;
        margin-top: 20px;
        color: #7f8c8d;
    }

    .form-footer a {
        color: #3498db;
        text-decoration: none;
        font-weight: 500;
    }

    .form-footer a:hover {
        text-decoration: underline;
    }

    @media (max-width: 480px) {
        form {
            margin: 30px 15px;
            padding: 20px;
        }
    }
</style>

	<form action="loginServlet" method="post">
        <h2>Welcome Back</h2>
        
		<label for="email">Email</label>
		<input type="text" name="email" id="email" required placeholder="Enter your email">
		
		<label for="password">Password</label>
		<input type="password" name="password" id="password" required placeholder="Enter your password">
	
		<button type="submit">LOGIN</button>
        
        <div class="form-footer">
            Don't have an account? <a href="register.jsp">Sign up</a>
        </div>
	</form>

</body>
</html>