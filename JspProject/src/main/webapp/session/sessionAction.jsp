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
request.setCharacterEncoding("utf-8");
String msg=(String)session.getAttribute("msg");
String travel=request.getParameter("travel");

if(msg==null || !msg.equals("Happytime"))
{%>
	<h3 style="color:red;">시간초과 땡</h3>
<%}
{%>
	<h3 style="color:blue;">축하합니다 <%=travel %>상품에 신청되었습니다</h3>
<%}
%>
<a href="sessionMain.jsp">다시 선택</a>
</body>
</html>