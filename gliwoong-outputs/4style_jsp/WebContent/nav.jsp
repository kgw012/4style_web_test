<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>

<%
	String current_page = request.getParameter("current_page");
	
	String nav1_href = "main.jsp";
	String nav2_href = "influencer-style.jsp";
	String nav1_class = "";
	String nav2_class = "";
	
	switch(current_page){
		case "main.jsp":
			nav1_href = "#current";
			nav1_class = "active";
			break;
		case "AI_codi_research.jsp":
			nav1_href = "#current";
			nav1_class = "active";
			break;
		case "influencer-style.jsp":
			nav2_href = "#current";
			nav2_class = "active";
		default: break;
	}
%>

<nav id="nav">
	<ul>
		<li><a href="<%=nav1_href %>" class="<%=nav1_class%>">AI 코디네이팅</a></li>
		<li><a href="<%=nav2_href %>" class="<%=nav2_class%>">연예인 스타일링</a></li>
	</ul>
</nav>
