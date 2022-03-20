<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="user.UserDAO" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="user" class="user.User" scope="page" />
<jsp:setProperty name="user" property="user_id"/>
<jsp:setProperty name="user" property="user_pwd"/>

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
			PrintWriter script = response.getWriter();
			String user_id = null;
			if(session.getAttribute("user_id") != null){
				user_id = (String) session.getAttribute("user_id");
			}
			if(user_id != null){
				script.println("<script>");
				script.println("alert('이미 로그인이 되어있습니다.')");
				script.println("location.href = 'main.jsp'");
				script.println("</script>");
			}
			UserDAO userDAO = new UserDAO();
			int result = userDAO.login(user.getUser_id(), user.getUser_pwd());
			
			switch(result){
			case 1:  //login 성공
				session.setAttribute("user_id", user.getUser_id());
				script.println("<script>");
				script.println("location.href = 'main.jsp'");
				script.println("</script>");
				break;
			case 0:  //user_pwd 다름
				script.println("<script>");
				script.println("alert('잘못된 비밀번호입니다.')");
				script.println("history.back()");
				script.println("</script>");
				break;
			case -1:  //user_id 없음
				script.println("<script>");
				script.println("alert('존재하지 않는 아이디입니다.')");
				script.println("history.back()");
				script.println("</script>");
				break;
			case -2:  //db 오류
				script.println("<script>");
				script.println("alert('데이터베이스 오류가 발생했습니다.')");
				script.println("history.back()");
				script.println("</script>");
				break;
			}
		%>
	</body>
</html>