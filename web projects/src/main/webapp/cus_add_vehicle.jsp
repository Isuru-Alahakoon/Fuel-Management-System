<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import = "model.User" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Vehicle</title>
</head>
<body>

    <% User user = (User)session.getAttribute("user");%>
    <%@include file = 'header.jsp' %>

<style>
    body {
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        background-color: #f8f9fa;
        color: #333;
        line-height: 1.6;
        margin: 0;
        padding: 0;
    }

    .form-container {
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

    .form-title {
        text-align: center;
        margin-bottom: 25px;
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
        margin: 15px 0 5px;
        color: #2c3e50;
    }

    input[type="text"] {
        width: 100%;
        padding: 12px 15px;
        margin-bottom: 15px;
        border: 1px solid #ddd;
        border-radius: 5px;
        font-size: 16px;
        transition: all 0.3s;
    }

    input[type="text"]:focus {
        border-color: #3498db;
        box-shadow: 0 0 0 3px rgba(52, 152, 219, 0.2);
        outline: none;
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

    @media (max-width: 600px) {
        .form-container {
            margin: 20px 15px;
            padding: 20px;
        }
    }
</style>

    <div class="form-container">
        <h2 class="form-title">Add New Vehicle</h2>
        <form action="cus_add_vehicle" method="post">
            
            <input type="hidden" name="userID" value="<%=user.getUser_id() %>">
        
            <label>Brand</label>
            <input type="text" name="brand" placeholder="Ex: Toyota, Ford etc..." required>
            
            <label>Make</label>
            <input type="text" name="make" placeholder="Ex: Corolla, Mustang etc..." required>
            
            <label>Chasis Number</label>
            <input type="text" name="chasis_no" required>
            
            <label>Vehicle Type</label>
            <input type="text" name="v_type" placeholder="Ex: car, van etc...">
            
            <button type="submit">SAVE</button>
        </form>
    </div>
    
    <script>
    document.querySelector("form").addEventListener("submit", function(event) {
        const brand = document.querySelector('input[name="brand"]').value.trim();
        const make = document.querySelector('input[name="make"]').value.trim();
        const chasis = document.querySelector('input[name="chasis_no"]').value.trim();
        const vtype = document.querySelector('input[name="v_type"]').value.trim();

        // Brand validation
        if (brand === "") {
            alert("Brand is required.");
            event.preventDefault();
            return;
        }

        // Make validation
        if (make === "") {
            alert("Make is required.");
            event.preventDefault();
            return;
        }

        // Chasis number validation
        const chasisPattern = /^[a-zA-Z0-9-]+$/;
        if (chasis === "" || !chasisPattern.test(chasis)) {
            alert("Chasis Number is required and must be alphanumeric.");
            event.preventDefault();
            return;
        }

        // Vehicle type validation (optional)
        if (vtype !== "" && !/^[a-zA-Z\s]+$/.test(vtype)) {
            alert("Vehicle Type should only contain letters if provided.");
            event.preventDefault();
            return;
        }
    });
</script>
    

</body>
</html>