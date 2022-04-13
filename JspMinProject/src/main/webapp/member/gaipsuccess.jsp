<%@page import="data.dao.MemberDao"%>
<%@page import="data.dto.MemberDto"%>
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
//id를 읽는다
String id=request.getParameter("id");

//dao선언
MemberDao dao=new MemberDao();

//아이디에 대한 이름얻기
String name=dao.getName(id);
%>
<div style="margin: 0 auto; width: 100%">
	<img alt="" src="image2/1.png">
	<b><%=name%>님의 회원가입을 축하합니다</b>
	<br><br>
	<button type="button" class="btn btn-info"
	onclick="location.href='index.jsp?main=login/loginmain.jsp'">로그인</button>
	<button type="button" class="btn btn-success"
	onclick="location.href='index.jsp'">메인페이지</button>
</div>

</body>
</html>