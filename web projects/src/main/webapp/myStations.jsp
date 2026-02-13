<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Stations</title>
</head>
    
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f5f7fa;
            margin: 0;
            padding: 0;
        }
        
        .container{
            display:flex;
            justify-content: center;
            min-height: 100vh;
            width: calc(100vw - 230px);
            margin-left: 230px;
            padding: 30px;
        }
        
        .main{
            margin-top: 50px;
            width: 100%;
            max-width: 1200px;
            animation: fadeIn 0.6s ease-out;
        }
        
        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }
        
        .add-station-btn {
            background: linear-gradient(135deg, #27ae60, #2ecc71);
            color: white;
            border: none;
            padding: 12px 25px;
            border-radius: 6px;
            font-size: 16px;
            font-weight: 500;
            cursor: pointer;
            transition: all 0.3s;
            margin-bottom: 30px;
            text-decoration: none;
            display: inline-block;
            box-shadow: 0 4px 12px rgba(39, 174, 96, 0.2);
        }
        
        .add-station-btn:hover {
            background: linear-gradient(135deg, #2ecc71, #27ae60);
            transform: translateY(-2px);
            box-shadow: 0 6px 16px rgba(39, 174, 96, 0.3);
        }
        
        table {
            width: 100%;
            border-collapse: collapse;
            background: white;
            box-shadow: 0 5px 25px rgba(0, 0, 0, 0.05);
            border-radius: 10px;
            overflow: hidden;
        }
        
        th {
            background: linear-gradient(135deg, #2c3e50, #1a1a2e);
            color: white;
            padding: 15px;
            font-weight: 500;
            text-align: center;
        }
        
        td {
            padding: 12px 15px;
            border-bottom: 1px solid #eee;
            color: #555;
            text-align: center;
        }
        
        tr:nth-child(even) {
            background-color: #f9f9f9;
        }
        
        tr:hover {
            background-color: #f1f5f9;
        }
        
        .action-cell {
            display: flex;
            gap: 10px;
            justify-content: center;
        }
        
        .edit {
            background: linear-gradient(135deg, #3498db, #2980b9);
            color: white;
            border: none;
            padding: 8px 20px;
            border-radius: 5px;
            font-size: 14px;
            cursor: pointer;
            transition: all 0.3s;
            text-decoration: none;
            display: inline-block;
        }
        
        .edit:hover {
            background: linear-gradient(135deg, #2980b9, #3498db);
            transform: translateY(-2px);
            box-shadow: 0 4px 8px rgba(41, 128, 185, 0.3);
        }
        
        .del {
            background: linear-gradient(135deg, #e74c3c, #c0392b);
            color: white;
            border: none;
            padding: 8px 20px;
            border-radius: 5px;
            font-size: 14px;
            cursor: pointer;
            transition: all 0.3s;
        }
        
        .del:hover {
            background: linear-gradient(135deg, #c0392b, #e74c3c);
            transform: translateY(-2px);
            box-shadow: 0 4px 8px rgba(231, 76, 60, 0.3);
        }
        
        form {
            display: inline;
            margin: 0;
        }
        
        @media (max-width: 768px) {
            .container {
                padding: 20px;
            }
            
            .action-cell {
                flex-direction: column;
                gap: 5px;
            }
            
            th, td {
                padding: 10px 8px;
                font-size: 14px;
            }
        }
    </style>

<body>

    <%@include file = "managersidebar.jsp" %>
    
    <div class="container">
        <div class="main">
            <a href="manager_add_station.jsp" class="add-station-btn">＋ Add New Station</a>
            <table>
                <tr>
                    <th>Station Name</th>
                    <th>Station Email</th>
                    <th>Station Mobile</th>
                    <th>Station Address</th>
                    <th>Actions</th>
                </tr>
                <c:forEach var="stations" items="${stations}">
                    <tr>
                        <td>${stations.station_name}</td>
                        <td>${stations.station_email}</td>
                        <td>${stations.station_mobile}</td>
                        <td>${stations.station_address}</td>
                        <td class="action-cell">
                            <a href="manager_update_station.jsp?station_id=${stations.station_id}&s_name=${stations.station_name}&s_email=${stations.station_email}&s_mobile=${stations.station_mobile}&s_address=${stations.station_address}">
                                <button class="edit">UPDATE</button>
                            </a>
                            
                            <form action="manager_delete_station" method="post">
                                <input type="hidden" name="station_id" value="${stations.station_id}">
                                <button class="del">DELETE</button>
                            </form>
                        </td>
                    </tr>
                </c:forEach>
            </table>
        </div>
    </div>

</body>
</html>