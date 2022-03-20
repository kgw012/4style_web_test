<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.io.PrintWriter" %>

<%
	String current_page = "main.jsp";
	String user_id = null;
	if(session.getAttribute("user_id") != null){
		user_id = (String) session.getAttribute("user_id");
	}
%>

<!DOCTYPE HTML>
<!--
	Stellar by HTML5 UP
	html5up.net | @ajlkn
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
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
			<jsp:include page="nav.jsp" flush="true">
				<jsp:param name="current_page" value="<%=current_page %>"/>
			</jsp:include>

			<!-- Main -->
			<div id="main">
				<section id="current" class="main special">
					<header class="major">
						<h2>옷 사진을 찍어보세요!</h2>
					</header>
					<ul class="features">
						<li>
							<a id="camera" class="icon solid major style1 fa-camera" href="#사진업로드"></a> <!--사진 업로드하기 구현필요-->
							<h3>코디 자동추천</h3>
							<p>사진기 아이콘을 클릭해 옷 사진을 찍어보세요.</p>
						</li>
					</ul>
					<footer class="major">
						<ul class="actions special">
							<li><a href="AI_codi_research.jsp" class="button primary">분석하기</a></li> <!--1-2페이지 구현필요-->
						</ul>
					</footer>
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
	</body>
</html>