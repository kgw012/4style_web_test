<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>

<%
	String current_page = request.getParameter("current_page");
	String user_id = null;
	if(session.getAttribute("user_id") != null){
		user_id = (String) session.getAttribute("user_id");
	}
	
	if(user_id == null){
%>
		<header id="header" class="alt">
			<span class="logo"><img src="assets/images/logo.svg" onclick="location.href='main.jsp'" alt="" /></span>
			<h1 onclick="location.href='main.jsp'">4Style</h1>
			<%
				out.println("<p>머신러닝을 이용한 코디네이팅 서비스입니다.<br/>");
				out.println("(<a href=\"login.jsp\">로그인</a>) (<a href=\"signup.jsp\">회원가입</a>)</p>");
			%>
		</header>
<%
	} else{
%>
		<header id="header" class="alt">
			<span class="logo"><img src="assets/images/logo.svg" onclick="location.href='main.jsp'" alt="" /></span>
			<h1 onclick="location.href='main.jsp'">4Style</h1>
			<%
				out.println("<p>머신러닝을 이용한 코디네이팅 서비스입니다.<br/>");
				out.println("(<a href=\"mypage.jsp\">my page</a>) (<a href=\"logout_action.jsp\">로그아웃</a>)</p>");
			%>
		</header>
<%
	}
%>
