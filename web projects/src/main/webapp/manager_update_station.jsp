<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Station</title>
</head>

    <style>
        .container{
            width: calc(100vw - 230px);
            margin-left: 230px;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            background-color: #f5f7fa;
        }
        
        .edit-form {
            background: white;
            padding: 40px;
            border-radius: 12px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
            width: 500px;
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
            margin-top: 25px;
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
    </style>

<body>

    <%
        String station_id = request.getParameter("station_id");
        String s_name = request.getParameter("s_name");
        String s_email = request.getParameter("s_email");
        String s_mobile = request.getParameter("s_mobile");
        String s_address = request.getParameter("s_address");
    %>
    
    <%@include file = "managersidebar.jsp" %>
    
    <div class="container">
        <div class="edit-form">
            <h2 class="form-title">Edit Station Details</h2>
            <form action="manager_edit_station" method="post">
                <input type="hidden" name="s_id" value="<%=station_id %>">
                
                <label>Station Name</label>
                <input type="text" name="s_name" value="<%=s_name %>">
                
                <label>Station Email</label>
                <input type="text" name="s_email" value="<%=s_email %>">
                
                <label>Station Mobile</label>
                <input type="text" name="s_mobile" value="<%=s_mobile %>">
                
                <label>Station Address</label>
                <input type="text" name="s_address" value="<%=s_address %>">
                
                <button type="submit">UPDATE STATION</button>
            </form>
        </div>
    </div>

</body>
</html>