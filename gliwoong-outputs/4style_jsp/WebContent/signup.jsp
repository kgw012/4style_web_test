<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    
<%
	String current_page = "signup.jsp";
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
			<header id="header" class="alt">
				<span class="logo"><img src="assets/images/logo.svg" onclick="location.href='main.jsp'" alt="" /></span>
				<h1 onclick="location.href='main.jsp'">4Style</h1>
				<p>회원가입 페이지<br/>
			</header>

			<!-- Main -->
			<div id="main">
				<section class="main special">
					<header class="major">
						<h2>회원가입</h2>
					</header>
					<div class="box alt">
						<div class="row gtr-uniform">
							<div class="col-1"></div>
							<div class="col-10">
								<form method="post" action="signup_action.jsp">
									<br/>
									<input type="email" placeholder="아이디(이메일 형식)" name="user_id" maxlength="30"/>
									<br/>
									<input type="password" id="user_pwd" placeholder="비밀번호" name="user_pwd" maxlength="20"/>
									<br/>
									<input type="password" id="user_pwd_check" placeholder="비밀번호 확인" name="user_pwd_check" maxlength="20"/>
									<font id="check_notice" size="2" style="float: left"></font>
									<br/>
									<input type="text" placeholder="이름" name="user_name" maxlength="10"/>
									<br/>
									<input type="radio" id="user_sex_men" name="user_sex" value="남자" checked>
									<label>남자</label>
									<input type="radio" id="user_sex_women" name="user_sex" value="여자">
									<label>여자</label>
									<br/>
									<br/>
									<input type="submit" class="button primary" value="가입하기">
									<br/>
									<br/>
								</form>
							</div>
							<div class="col-1"></div>
						</div>
					</div>
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