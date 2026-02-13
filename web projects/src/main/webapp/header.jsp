<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Navigation Menu</title>
</head>
<body>

<style>
	* {
		margin: 0;
		padding: 0;
		box-sizing: border-box;
		font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
	}
	
	nav {
		width: 100%;
		background: linear-gradient(135deg, #2c3e50, #1a1a2e);
		padding: 15px 0;
		box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
		position: relative;
	}
	
	nav ul {
		max-width: 1200px;
		margin: 0 auto;
		padding: 0 20px;
		display: flex;
		align-items: center;
	}
	
	nav ul li {
		list-style: none;
		margin: 0 5px;
		position: relative;
	}
	
	.right {
		margin-left: auto;
	}
	
	nav ul li a {
		padding: 12px 18px;
		color: #f8f9fa;
		text-decoration: none;
		font-size: 1rem;
		font-weight: 500;
		letter-spacing: 0.5px;
		border-radius: 4px;
		transition: all 0.3s ease;
		display: inline-block;
	}
	
	nav ul li a:hover {
		background: rgba(255, 255, 255, 0.1);
		transform: translateY(-2px);
		color: #ffffff;
	}
	
	nav ul li a:active {
		transform: translateY(0);
	}
	
	/* Animation for menu items */
	@keyframes fadeIn {
		from { opacity: 0; transform: translateY(10px); }
		to { opacity: 1; transform: translateY(0); }
	}
	
	nav ul li {
		animation: fadeIn 0.5s ease forwards;
	}
	
	nav ul li:nth-child(1) { animation-delay: 0.1s; }
	nav ul li:nth-child(2) { animation-delay: 0.2s; }
	nav ul li:nth-child(3) { animation-delay: 0.3s; }
	nav ul li:nth-child(4) { animation-delay: 0.4s; }
	nav ul li:nth-child(5) { animation-delay: 0.5s; }
	nav ul li:nth-child(6) { animation-delay: 0.6s; }
	nav ul li:nth-child(7) { animation-delay: 0.7s; }
	
	/* Responsive adjustments */
	@media (max-width: 768px) {
		nav ul {
			flex-wrap: wrap;
			justify-content: center;
		}
		
		.right {
			margin-left: 0;
			margin-top: 10px;
		}
		
		nav ul li {
			margin: 5px;
		}
	}
</style>

	<nav>
		<ul>
			<li><a href="index.jsp">Home</a></li>
			<li><a href="manager_register.jsp">Register as a station manager</a></li>
			<li><a href="cus_get_stations">Book your Service</a></li>
			<li><a href="cus_get_stations_fuels">Order Fuel</a></li>
			<li class="right"><a href="customer_get_vehicle">My Profile</a></li>
			<li class="right"><a href="register.jsp">Sign Up</a></li>
			<li class="right"><a href="login.jsp">Sign In</a></li>
		</ul>
	</nav>

</body>
</html>