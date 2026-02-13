<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Customer Registration</title>
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
        max-width: 450px;
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
    input[type="email"],
    input[type="password"],
    input[type="tel"] {
        width: 100%;
        padding: 12px 15px;
        margin: 8px 0 15px;
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

    label {
        display: block;
        font-weight: 500;
        color: #2c3e50;
        margin-top: 15px;
    }

    button {
        width: 100%;
        padding: 14px;
        background: linear-gradient(135deg, #27ae60, #2ecc71);
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
        background: linear-gradient(135deg, #2ecc71, #27ae60);
        transform: translateY(-2px);
        box-shadow: 0 5px 15px rgba(46, 204, 113, 0.4);
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

	<form id = "registrationForm" action="customer_register" method="post">
        <h2>Create Your Account</h2>
        
        <label for="nic">NIC</label>
        <input type="text" name="nic" id="nic" required placeholder="Enter your NIC number">
        
        <label for="name">Full Name</label>
        <input type="text" name="name" id="name" required placeholder="Enter your full name">
        
        <label for="email">Email</label>
        <input type="email" name="email" id="email" required placeholder="Enter your email address">
        
        <label for="pass">Password</label>
        <input type="password" name="pass" id="pass" required placeholder="Create a password">
        
        <label for="mobile">Phone Number</label>
        <input type="text" name="mobile" id="mobile" required placeholder="Enter your phone number">
        
        <input type="hidden" name="user_type" value="customer">
        
        <button type="submit">REGISTER</button>
        
        <div class="form-footer">
            Already have an account? <a href="login.jsp">Sign in</a>
        </div>
	</form>
	
	<script>
    document.getElementById("registrationForm").addEventListener("submit", function(event) {
        const password = document.getElementById("pass").value;

        let hasUpper = false;
        let hasLower = false;
        let hasDigit = false;
        let hasSpecial = false;

        if (password.length < 8) {
            alert("Password must be at least 8 characters long.");
            event.preventDefault();
            return;
        }

        for (let i = 0; i < password.length; i++) {
            const char = password.charAt(i);
            if (char >= 'A' && char <= 'Z') hasUpper = true;
            else if (char >= 'a' && char <= 'z') hasLower = true;
            else if (char >= '0' && char <= '9') hasDigit = true;
            else hasSpecial = true;
        }

        if (!hasUpper || !hasLower || !hasDigit || !hasSpecial) {
            alert("Password must include at least one uppercase letter, one lowercase letter, one number, and one special character.");
            event.preventDefault();
        }
    });
</script>
	

</body>
</html>