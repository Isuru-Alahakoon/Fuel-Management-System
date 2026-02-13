<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update Fuel Stock | Sri Drive</title>
<style>
    :root {
        --primary: #4361ee;
        --primary-dark: #3a56d4;
        --secondary: #3f37c9;
        --accent: #4895ef;
        --dark: #1a1a2e;
        --light: #f8f9fa;
        --success: #4cc9f0;
        --warning: #f72585;
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
        display: flex;
        width: calc(100vw - 230px);
        height: 100vh;
        margin-left: 230px;
        justify-content: center;
        align-items: center;
    }
    
    .main {
        width: 100%;
        max-width: 500px;
        background: white;
        border-radius: 12px;
        box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);
        padding: 40px;
        animation: fadeIn 0.5s ease;
    }
    
    h1 {
        color: var(--dark);
        margin-bottom: 30px;
        font-size: 1.8rem;
        font-weight: 600;
        text-align: center;
    }
    
    form {
        display: flex;
        flex-direction: column;
        gap: 20px;
    }
    
    .form-group {
        display: flex;
        flex-direction: column;
        gap: 8px;
    }
    
    label {
        font-weight: 500;
        color: var(--dark);
        font-size: 0.95rem;
    }
    
    input[type="text"],
    input[type="number"] {
        padding: 12px 15px;
        border: 1px solid #ddd;
        border-radius: 6px;
        font-size: 1rem;
        transition: all 0.3s ease;
    }
    
    input[type="text"]:focus,
    input[type="number"]:focus {
        outline: none;
        border-color: var(--primary);
        box-shadow: 0 0 0 2px rgba(67, 97, 238, 0.2);
    }
    
    button {
        background-color: var(--primary);
        color: white;
        border: none;
        padding: 12px 20px;
        border-radius: 6px;
        cursor: pointer;
        font-weight: 500;
        transition: all 0.3s ease;
        font-size: 1rem;
        margin-top: 10px;
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
        .content {
            width: 100%;
            margin-left: 0;
            padding: 20px;
        }
        
        .main {
            padding: 30px 20px;
        }
    }
</style>
</head>
<body>

    <%@include file = "attendant_sidebar.jsp" %>
    
    <%
        String amount = request.getParameter("amount");
        String stockid = request.getParameter("stockid");
        String fuelid = request.getParameter("fuelid");
    %>
    
    <div class="content">
        <div class="main">
            <h1>Update Fuel Stock</h1>
            <form action="attendant_update_fuelStock" method="post">
                <input type="hidden" name="stockid" value="<%=stockid %>">
                <input type="hidden" name="fuelid" value="<%=fuelid %>">
                
                <div class="form-group">
                    <label for="amount">Fuel Amount (Liters)</label>
                    <input type="number" name="amount" id="amount" value="<%=amount %>" required>
                </div>
                
                <button type="submit">Update Stock</button>
            </form>
        </div>
    </div>

</body>
</html>