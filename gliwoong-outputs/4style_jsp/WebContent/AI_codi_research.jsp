<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    
<%
	String current_page = "AI_codi_research.jsp";
	String page_num_str = request.getParameter("page_num");
	int page_num = 0;
	if(page_num_str == null) page_num = 1;
	else page_num = Integer.parseInt(page_num_str);
	
	String keyword = "흰색 티";
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
				<!-- AI 이미지&그래프 섹션 -->
				<section id="current" class="main special">
					<header class="major">
						<h2>AI 분석 결과</h2>
					</header>
					<div class="box alt statistics">
						<div class="row gtr-uniform">
							<!--사진-->
							<div id="research-image-wrapper" class="col-4">
								<span class="image fit"><img id="research-image" src="assets/images/test_image02.jpg" alt="" /></span>
							</div>
							<!--그래프-->
							<div id="research-graph" class="col-8">
								<canvas id="myChart"></canvas>
							</div>
						</div>
					</div>
					<!--버튼-->
					<div class="box alt">
						<div class="row gtr-uniform">
							<div class="col-4"></div>
							<div class="col-4"><a href="#" class="button primary fit small icon solid fa-search">추천</a></div>
							<div class="col-4"></div>
						</div>
					</div>
				</section>
				
				<!-- 상품목록 섹션 -->
				<jsp:include page="item_list.jsp" flush="true">
					<jsp:param name="current_page" value="<%=current_page %>"/>
					<jsp:param name="page_num" value="<%=page_num %>" />
					<jsp:param name="keyword" value="<%=keyword %>" />
				</jsp:include>
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