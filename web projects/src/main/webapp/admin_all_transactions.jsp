<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    /* PURE CSS ENHANCEMENTS - NO HTML CHANGES */
    body {
        font-family: 'Inter', system-ui, -apple-system, sans-serif;
        background-color: #f5f7fa;
        margin: 0;
        padding: 0;
        color: #1a1a2e;
    }
    
    .container {
        width: calc(100vw - 230px);
        margin-left: 230px;
        min-height: 100vh;
        padding: 2rem;
        display: flex;
        justify-content: center;
        background-color: #f5f7fa;
    }
    
    .main {
        width: 100%;
        max-width: 1200px;
        background: white;
        border-radius: 12px;
        box-shadow: 0 4px 6px rgba(0, 0, 0, 0.05);
        padding: 2rem;
    }
    
    table {
        width: 100%;
        border-collapse: collapse;
        margin-top: 1.5rem;
        font-size: 0.9rem;
    }
    
    th {
        background-color: #4361ee;
        color: white;
        padding: 1rem;
        text-align: left;
        font-weight: 500;
        text-transform: uppercase;
        letter-spacing: 0.5px;
        position: sticky;
        top: 0;
    }
    
    td {
        padding: 1rem;
        border-bottom: 1px solid #e0e0e0;
    }
    
    tr:nth-child(even) {
        background-color: #f9f9f9;
    }
    
    tr:hover {
        background-color: #f1f5fe;
    }
    
    /* Status badges */
    td:last-child {
        font-weight: 500;
    }
    
    /* Responsive adjustments */
    @media (max-width: 1024px) {
        .container {
            padding: 1rem;
        }
        
        .main {
            padding: 1.5rem;
        }
    }
    
    @media (max-width: 768px) {
        .container {
            width: 100%;
            margin-left: 0;
            padding: 1rem;
        }
        
        table {
            display: block;
            overflow-x: auto;
            white-space: nowrap;
        }
        
        th, td {
            padding: 0.75rem;
        }
    }
</style>
</head>
<body>

	<%@include file = "admin_sidebar.jsp" %>

	<div class = "container">
	
		<div class = "main">
		
			<%
				String purchase = (String)request.getAttribute("purchase");
				
				if(purchase.equals("service")){
					
					%>
					
						<table>
							<tr>
								<th>Registered Customer Name</th>
								<th>Registered Customer Mobile</th>
								<th>Manual Customer Name</th>
								<th>Manual Customer Mobile</th>
								<th>Vehicle</th>
								<th>Description</th>
								<th>Price</th>
								<th>Status</th>
							</tr>
												
							<c:forEach var = "services" items = "${services}">
							<tr>
								<td>${services.auto_user_name}</td>
								<td>${services.auto_user_mobile}</td>
								<td>${services.manual_cusName}</td>
								<td>${services.cus_mobile}</td>
								<td>${services.vehicle_name}</td>
								<td>${services.description}</td>
								<td>${services.price}</td>
								<td>${services.status}</td>
							</tr>
							</c:forEach>
									
						</table>
					
					<%
					
				}
				else if(purchase.equals("fuel"))
				{
					%>
					
						<table>
							<tr>
								<th>Fuel Type</th>
								<th>Customer Name</th>
								<th>Customer Mobile</th>
								<th>Fuel Amount(Liters)</th>
								<th>Price</th>
								
							</tr>
												
							<c:forEach var = "fuels" items = "${fuels}">
							<tr>
								<td>${fuels.fuel_type}</td>
								<td>${fuels.uname}</td>
								<td>${fuels.uMobile}</td>
								<td>${fuels.amount}</td>
								<td>${fuels.price}</td>
							</tr>
							</c:forEach>
									
						</table>
					
					<%
				}
			%>
		</div>
	</div>

</body>
</html>