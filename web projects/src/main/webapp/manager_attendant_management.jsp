<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Attendant Management</title>
</head>

    <style>
        .container{
            width: calc(100vw - 230px);
            margin-left: 230px;
            padding: 30px;
            background-color: #f5f7fa;
            min-height: 100vh;
        }
        
        .main{
            display: flex;
            justify-content: center;
            margin-top: 30px;
        }
        
        .station-selector {
            background: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 5px 15px rgba(0,0,0,0.05);
            display: flex;
            align-items: center;
            gap: 15px;
            flex-wrap: wrap;
        }
        
        .station-selector select {
            padding: 10px 15px;
            border: 1px solid #ddd;
            border-radius: 6px;
            font-size: 16px;
            min-width: 250px;
            transition: all 0.3s;
        }
        
        .station-selector select:focus {
            border-color: #3498db;
            box-shadow: 0 0 0 3px rgba(52, 152, 219, 0.2);
            outline: none;
        }
        
        .station-selector button {
            background: linear-gradient(135deg, #3498db, #2980b9);
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 6px;
            font-size: 16px;
            cursor: pointer;
            transition: all 0.3s;
        }
        
        .station-selector button:hover {
            background: linear-gradient(135deg, #2980b9, #3498db);
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(41, 128, 185, 0.3);
        }
        
        hr {
            border: none;
            height: 1px;
            background-color: #eee;
            margin: 25px 0;
        }
        
        .table {
            background: white;
            padding: 25px;
            border-radius: 10px;
            box-shadow: 0 5px 25px rgba(0,0,0,0.05);
            width: 100%;
            max-width: 1000px;
            animation: fadeIn 0.6s ease-out;
        }
        
        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }
        
        .add-attendant-btn {
            display: inline-block;
            background: linear-gradient(135deg, #27ae60, #2ecc71);
            color: white;
            padding: 10px 20px;
            border-radius: 6px;
            text-decoration: none;
            margin-bottom: 20px;
            transition: all 0.3s;
        }
        
        .add-attendant-btn:hover {
            background: linear-gradient(135deg, #2ecc71, #27ae60);
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(46, 204, 113, 0.3);
        }
        
        table {
            width: 100%;
            border-collapse: collapse;
            text-align: center;
        }
        
        th {
            background: linear-gradient(135deg, #2c3e50, #1a1a2e);
            color: white;
            padding: 15px;
            font-weight: 500;
        }
        
        td {
            padding: 12px 15px;
            border-bottom: 1px solid #eee;
            color: #555;
        }
        
        tr:nth-child(even) {
            background-color: #f9f9f9;
        }
        
        tr:hover {
            background-color: #f1f5f9;
        }
        
        .action-btn {
            padding: 8px 15px;
            border: none;
            border-radius: 4px;
            font-size: 14px;
            cursor: pointer;
            transition: all 0.3s;
            margin: 0 5px;
        }
        
        .edit-btn {
            background: #3498db;
            color: white;
        }
        
        .delete-btn {
            background: #e74c3c;
            color: white;
        }
        
        .action-btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
        }
        
        @media (max-width: 768px) {
            .station-selector {
                flex-direction: column;
                align-items: flex-start;
            }
            
            .table {
                padding: 15px;
            }
            
            th, td {
                padding: 10px 8px;
            }
        }
    </style>

<body>

    <%@include file = 'managersidebar.jsp' %>
    
    <div class="container">
        
        <form action="manager_get_attendant" method="post" class="station-selector">
            <label>Select Your Station:</label>
            <select name="st_id">
                <c:forEach var="station" items="${station}">
                    <option value="${station.station_id}">${station.station_name}</option>
                </c:forEach>
            </select>
            <button type="submit">Show Attendants</button>
        </form>
        
        <hr>
        
        <div class="main">
            <div class="table">
                <a href="managerGetStationToAddAttendants" class="add-attendant-btn">＋ Add New Attendant</a>
                <table>
                    <tr>
                        <th>Name</th>
                        <th>Email</th>
                        <th>Mobile</th>
                        <th>Actions</th>
                    </tr>
                    
                    <c:forEach var="attendant" items="${attendant}">
                    <tr>
                        <td>${attendant.name}</td>
                        <td>${attendant.email}</td>
                        <td>${attendant.mobile}</td>
                        <td>
                            <button class="action-btn edit-btn">Edit</button>
                            <button class="action-btn delete-btn">Delete</button>
                        </td>
                    </tr>
                    </c:forEach>
                </table>
            </div>
        </div>
        
    </div>

</body>
</html>