<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="user.UserDAO" %>

<!DOCTYPE HTML>
<html>
	<head>
		<title>4Style</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=0.5, maximum-scale=2, user-scalable=yes" />
		<link rel="stylesheet" href="assets/css/main.css" />
	</head>
	<body>
		<%	
			session.invalidate();
		%>
		<script>
			location.href = 'main.jsp';
		</script>
	</body>
</html>