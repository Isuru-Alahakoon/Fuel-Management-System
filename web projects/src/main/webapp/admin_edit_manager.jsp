<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update Manager | Sri Drive</title>
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
    
    .container {
        width: calc(100vw - 230px);
        margin-left: 230px;
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
        padding: 20px;
    }
    
    .main-form {
        width: 100%;
        max-width: 600px;
        background: white;
        border-radius: 12px;
        box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);
        padding: 40px;
        animation: fadeIn 0.5s ease;
    }
    
    .main-form h1 {
        color: var(--dark);
        margin-bottom: 30px;
        font-size: 1.8rem;
        font-weight: 600;
        text-align: center;
    }
    
    .manager-id {
        background-color: var(--primary);
        color: white;
        padding: 8px 15px;
        border-radius: 20px;
        display: inline-block;
        margin-bottom: 20px;
        font-size: 0.9rem;
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
    input[type="password"],
    input[type="email"],
    input[type="tel"] {
        padding: 12px 15px;
        border: 1px solid #ddd;
        border-radius: 6px;
        font-size: 1rem;
        transition: all 0.3s ease;
    }
    
    input[type="text"]:focus,
    input[type="password"]:focus,
    input[type="email"]:focus,
    input[type="tel"]:focus {
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
        
        .main-form {
            padding: 30px 20px;
        }
    }
</style>
</head>
<body>

    <%@include file = 'admin_sidebar.jsp' %>
    
    <%
        String managerID = request.getParameter("managerID");
        String nic = request.getParameter("nic");
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String mobile = request.getParameter("mobile");
    %>
    
    <div class="container">
        <div class="main-form">
            <h1>Update Manager</h1>
            
            <form action="admin_edit_manager" method="post">
                <input type="hidden" name="managerID" value="<%=managerID %>">
                
                <div class="form-group">
                    <label for="nic">NIC</label>
                    <input type="text" name="nic" id="nic" value="<%=nic %>" required>
                </div>
                
                <div class="form-group">
                    <label for="name">Name</label>
                    <input type="text" name="name" id="name" value="<%=name %>" required>
                </div>
                
                <div class="form-group">
                    <label for="email">Email</label>
                    <input type="email" name="email" id="email" value="<%=email %>" required>
                </div>
                
                <div class="form-group">
                    <label for="mobile">Mobile</label>
                    <input type="tel" name="mobile" id="mobile" value="<%=mobile %>" required>
                </div>
                
                <button type="submit">UPDATE MANAGER</button>
            </form>
        </div>
    </div>

</body>
</html>