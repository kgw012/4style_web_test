<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="user.UserDAO" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="user" class="user.User" scope="page" />
<jsp:setProperty name="user" property="user_id"/>
<jsp:setProperty name="user" property="user_name"/>
<jsp:setProperty name="user" property="user_pwd"/>
<jsp:setProperty name="user" property="user_sex"/>

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
			String user_pwd_check = request.getParameter("user_pwd_check");
			if(user.getUser_id() == null || user.getUser_name() == null || user.getUser_pwd() == null || user.getUser_sex() == null
					|| !user.getUser_pwd().equals(user_pwd_check)){
				if(user.getUser_id() == null){
					script.println("<script>");
					script.println("alert('아이디를 입력해주세요.')");
					script.println("history.back()");
					script.println("</script>");
				} else if(user.getUser_name() == null){
					script.println("<script>");
					script.println("alert('이름을 입력해주세요.')");
					script.println("history.back()");
					script.println("</script>");
				} else if(user.getUser_pwd() == null){
					script.println("<script>");
					script.println("alert('비밀번호를 입력해주세요.')");
					script.println("history.back()");
					script.println("</script>");
				} else if(user.getUser_sex() == null){
					script.println("<script>");
					script.println("alert('성별을 체크해주세요.')");
					script.println("history.back()");
					script.println("</script>");
				} else if(!user.getUser_pwd().equals(user_pwd_check)){
					script.println("<script>");
					script.println("alert('비밀번호를 확인해주세요.')");
					script.println("history.back()");
					script.println("</script>");
				}
			} else{
				UserDAO userDAO = new UserDAO();
				int result = userDAO.signup(user);
				
				switch(result){
				case -1:  //이미 db에 해당 아이디가 있음
					script.println("<script>");
					script.println("alert('이미 존재하는 아이디입니다.')");
					script.println("history.back()");
					script.println("</script>");
					break;
				default:  //회원가입 성공
					script.println("<script>");
					script.println("alert('회원가입에 성공했습니다!')");
					script.println("location.href = 'login.jsp'");
					script.println("</script>");
					break;
				}
			}
		%>
	</body>
</html>