<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Service</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<style>
    body {
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        background-color: #f5f7fa;
        margin: 0;
        padding: 0;
    }
    
    .content {
        width: calc(100% - 230px);
        margin-left: 230px;
        display: flex;
        justify-content: center;
        align-items: center;
        min-height: 100vh;
        padding: 20px;
        box-sizing: border-box;
    }
    
    .main {
        background: white;
        padding: 30px;
        border-radius: 10px;
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
        margin: 15px 0 8px;
        color: #2c3e50;
    }
    
    input[type="text"],
    input[type="datetime-local"],
    select {
        width: 100%;
        padding: 12px 15px;
        margin-bottom: 15px;
        border: 1px solid #ddd;
        border-radius: 6px;
        font-size: 16px;
        transition: all 0.3s;
        box-sizing: border-box;
    }
    
    input:focus,
    select:focus {
        border-color: #3498db;
        box-shadow: 0 0 0 3px rgba(52, 152, 219, 0.2);
        outline: none;
    }
    
    button {
        width: 100%;
        padding: 14px;
        background: linear-gradient(135deg, #3498db, #2980b9);
        color: white;
        border: none;
        border-radius: 6px;
        font-size: 16px;
        font-weight: 600;
        cursor: pointer;
        transition: all 0.3s;
        margin-top: 20px;
    }
    
    button:hover {
        background: linear-gradient(135deg, #2980b9, #3498db);
        transform: translateY(-2px);
        box-shadow: 0 5px 15px rgba(41, 128, 185, 0.3);
    }
    
    /* Responsive adjustments */
    @media (max-width: 768px) {
        .content {
            width: 100%;
            margin-left: 0;
            padding: 15px;
            align-items: flex-start;
            min-height: auto;
        }
        
        .main {
            padding: 20px;
        }
        
        .form-title {
            font-size: 20px;
        }
        
        input[type="text"],
        input[type="datetime-local"],
        select {
            padding: 10px 12px;
            font-size: 14px;
        }
    }
    
    @media (max-width: 480px) {
        .main {
            padding: 15px;
        }
        
        label {
            font-size: 14px;
        }
        
        button {
            padding: 12px;
            font-size: 15px;
        }
    }
</style>
</head>
<body>

    <%@include file = 'attendant_sidebar.jsp' %>
    
    <%
        String s_purchase_id = request.getParameter("s_purchase_id"); 
        String description = request.getParameter("description");
        String price = request.getParameter("price");
        String payMethod = request.getParameter("payMethod");
        String status = request.getParameter("status");
        String dateTime = request.getParameter("dateTime");
    %>
    
    <div class="content">
        <div class="main">
            <h2 class="form-title">Edit Service Details</h2>
            <form action="attendant_edit_service" method="post">
                <input type="hidden" name="s_purchase_id" value="<%=s_purchase_id %>">
                
                <label>Description</label>
                <input type="text" name="description" value="<%=description %>">
                
                <label>Price</label>
                <input type="text" name="price" value="<%=price %>">
                
                <label>Payment Method</label>
                <select name="payMethod">
                    <option value="card" <%= "card".equals(payMethod) ? "selected" : "" %>>Card</option>
                    <option value="cash" <%= "cash".equals(payMethod) ? "selected" : "" %>>Cash</option>
                </select>
                
                <label>Status</label>
                <select name="status">
                    <option value="completed" <%= "completed".equals(status) ? "selected" : "" %>>Completed</option>
                    <option value="pending" <%= "pending".equals(status) ? "selected" : "" %>>Pending</option>
                </select>
                
                <label>Date Time</label>
                <input type="datetime-local" name="dateTime" value="<%=dateTime %>">
                
                <button type="submit">UPDATE SERVICE</button>
            </form>
        </div>
    </div>

</body>
</html>