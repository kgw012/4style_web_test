<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("utf-8"); %>

<%
	String current_page = "mypage.jsp";
	String user_id = null;
	if(session.getAttribute("user_id") != null){
		user_id = (String) session.getAttribute("user_id");
	}
	
	if(user_id == null){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('로그인 후 이용해주세요.')");
		script.println("location.href = 'login.jsp'");
		script.println("</script>");
	}
%>

<!DOCTYPE HTML>
<html>
	<head>
		<title>4Style</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=0.5, maximum-scale=2, user-scalable=yes" />
		<link rel="stylesheet" href="assets/css/main.css" />
	</head>
	<body class="is-preload">
		<div id="wrapper">
			<!-- Header -->
			<jsp:include page="header.jsp" flush="true">
				<jsp:param name="current_page" value="<%=current_page %>"/>
			</jsp:include>

			<!-- Nav -->
			<jsp:include page="nav2.jsp" flush="true">
				<jsp:param name="current_page" value="<%=current_page %>"/>
			</jsp:include>

			<!-- Main -->
			<div id="main">
				<section id="current" class="main special">
					<header class="major">
						<h2>내 옷장 분석</h2>
						<canvas id="myChart2"></canvas>
					</header>
				</section>
			</div>

			<!-- Footer -->
			<jsp:include page="footer.jsp" flush="true">
				<jsp:param name="current_page" value="<%=current_page %>"/>
			</jsp:include>
		</div>

		<!-- Scripts -->
		<jsp:include page="add_main_scripts.jsp" flush="true">
			<jsp:param name="current_page" value="<%=current_page %>"/>
		</jsp:include>
		<script src="assets/chart/Chart.min.js"></script>
		<script src="assets/js/myChart.js"></script>
	</body>
</html>