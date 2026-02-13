<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update Fuel Stock</title>
</head>

    <style>
        .container{
            display: flex;
            width: calc(100vw - 230px);
            height: 100vh;
            justify-content: center;
            align-items: center;
            margin-left: 230px;
            background-color: #f5f7fa;
        }
        
        .main {
            background: white;
            padding: 40px;
            border-radius: 12px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
            width: 450px;
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
        
        input[type="text"] {
            width: 100%;
            padding: 12px 15px;
            margin-bottom: 5px;
            border: 1px solid #ddd;
            border-radius: 6px;
            font-size: 16px;
            transition: all 0.3s;
        }
        
        input[type="text"]:focus {
            border-color: #3498db;
            box-shadow: 0 0 0 3px rgba(52, 152, 219, 0.2);
            outline: none;
        }
        
        .fuel-type-display {
            background-color: #f1f5f9;
            padding: 12px 15px;
            border-radius: 6px;
            margin-bottom: 15px;
            font-weight: 500;
            color: #2c3e50;
        }
        
        button {
            width: 100%;
            padding: 14px;
            background: linear-gradient(135deg, #f39c12, #e67e22);
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
            background: linear-gradient(135deg, #e67e22, #f39c12);
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(230, 126, 34, 0.4);
        }
        
        button:active {
            transform: translateY(0);
        }
    </style>

<body>

    <%
        String stock_id = request.getParameter("stockid");
        String fuel_type = request.getParameter("fuel_type");
        String amount = request.getParameter("amount");
        String fuel_id = request.getParameter("fuel_id");
    %>

    <%@include file = "managersidebar.jsp" %>
    
    <div class="container">
        <div class="main">
            <h2 class="form-title">Update Fuel Stock</h2>
            <form action="manager_update_fuelStock" method="post">
                <input type="hidden" name="stockid" value="<%=stock_id %>">
                
                <label>Fuel Type</label>
                <div class="fuel-type-display"><%=fuel_type %></div>
                <input type="hidden" name="fuel_id" value="<%=fuel_id %>">
                
                <label>Amount (Liters)</label>
                <input type="text" name="amount" value="<%=amount %>">
                
                <button type="submit">UPDATE STOCK</button>
            </form>
        </div>
    </div>

</body>
</html>