<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>

	<style>
		
		*{
			margin: 0;
			padding: 0;
			box-sizing: border-box;
		}
	
		.content{
			width: calc(100vw - 230px);
			margin-left: 230px;
			padding: 10px;
			
		}
		
		.users{
			
			display: flex;
			align-items: center;
			padding: 10px 0px 10px 0px;
			border-bottom: solid 1px lightgray;
		}
		
		.users a{
			
			padding: 10px 15px;
			text-decoration: none;
			color: white;
			border-radius: 5px;
			margin: 0px 20px;
		}
		
		.users a:nth-child(1){
			
			background-color: slateblue;
		}
		
		.users a:nth-child(2){
			
			background-color: lightgreen;
			color: black;
		}
		
		.users a:nth-child(3){
			
			background-color: red;
		}
	</style>

<body>

	<div class = "content">
		<div class = "users">
			<a href = "admin_get_managers">Station Managers</a>
			<a href = "#">Attendants</a>
			<a href = "#">Customers</a>
		</div>
	</div>

</body>
</html>