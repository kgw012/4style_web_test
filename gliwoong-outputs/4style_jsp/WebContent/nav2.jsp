<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>

<%
	String current_page = request.getParameter("current_page");
	
	String nav1_href = "mypage.jsp";
	String nav2_href = "like_list.jsp";
	String nav1_class = "";
	String nav2_class = "";
	
	switch(current_page){
		case "mypage.jsp":
			nav1_href = "#current";
			nav1_class = "active";
			break;
		case "like_list.jsp":
			nav2_href = "#current";
			nav2_class = "active";
		default: break;
	}
%>

<nav id="nav">
	<ul>
		<li><a href="<%=nav1_href %>" class="<%=nav1_class%>">내 옷장 분석</a></li>
		<li><a href="<%=nav2_href %>" class="<%=nav2_class%>"><span class="icon solid style1 fa-heart"></span>찜 목록</a></li>
	</ul>
</nav>
