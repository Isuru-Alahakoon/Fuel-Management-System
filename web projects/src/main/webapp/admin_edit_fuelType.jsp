<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Fuel Type | Sri Drive</title>
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
        height: calc(100vh - 80px);
        padding: 20px;
        display: flex;
        justify-content: center;
        align-items: center;
    }
    
    .edit-form {
        width: 100%;
        max-width: 500px;
        background: white;
        border-radius: 12px;
        box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);
        padding: 40px;
        animation: fadeIn 0.5s ease;
    }
    
    .edit-form h2 {
        color: var(--dark);
        margin-bottom: 30px;
        font-size: 1.5rem;
        font-weight: 600;
        text-align: center;
    }
    
    .fuel-id {
        background-color: var(--primary);
        color: white;
        padding: 6px 12px;
        border-radius: 20px;
        display: inline-block;
        margin-bottom: 20px;
        font-size: 0.8rem;
        font-weight: 500;
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
        .container {
            width: 100%;
            margin-left: 0;
            padding: 20px;
        }
        
        .edit-form {
            padding: 30px 20px;
        }
    }
</style>
</head>
<body>

    <%@include file = "admin_sidebar.jsp" %>
    
    <%
        String f_id = request.getParameter("f_id");
        String f_type = request.getParameter("f_type");
        String f_price = request.getParameter("f_price");
    %>
    
    <div class="container">
        <div class="edit-form">
            <h2>Edit Fuel Type</h2>
            
            <form action="admin_update_fuelType" method="post">
                <input type="hidden" name="f_id" value="<%=f_id %>">
                
                <div class="form-group">
                    <label for="f_type">Fuel Type</label>
                    <input type="text" name="f_type" id="f_type" value="<%=f_type %>" required>
                </div>
                
                <div class="form-group">
                    <label for="f_price">Fuel Price</label>
                    <input type="number" name="f_price" id="f_price" value="<%=f_price %>" step="0.01" required>
                </div>
                
                <button type="submit">UPDATE FUEL TYPE</button>
            </form>
        </div>
    </div>

</body>
</html>