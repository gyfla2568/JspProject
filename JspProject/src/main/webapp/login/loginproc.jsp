<%@page import="log.LogDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Dokdo&family=East+Sea+Dokdo&family=Gugi&family=Hi+Melody&family=Sunflower:wght@300&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

</head>
<body>
<%
String id=request.getParameter("id");
String pass=request.getParameter("pass");
String save=request.getParameter("savechk");


//아이디 비번 맞는지 확인
LogDao db=new LogDao();
boolean flag=db.isLogin(id,pass);


//맞으면 세션저장후에 로그인메인으로 이동
if(flag)
{
	//로그인중인지 알 수 있는 세션저장
	session.setAttribute("loginok", "yes");
	//아이디,체크값 저장
	session.setAttribute("idok", id);
	//체크하면 on 체크안하면 null
	session.setAttribute("saveok", save);
	
	//세션유지시간
	session.setMaxInactiveInterval(60*60*8); //8시간동안 유지
	
	//로그인메인으로 이동
	response.sendRedirect("loginmain.jsp");
	
}else
{
	%>
	<script type="text/javascript">
	alert("아이디와 비밀번호가 일치하지 않습니다");
	history.back();
		
	</script>
<%}


%>
</body>
</html>