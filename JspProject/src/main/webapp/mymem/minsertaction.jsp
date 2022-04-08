<%@page import="mymem.myDao"%>
<%@page import="mymem.myDto"%>
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

String name=request.getParameter("name");
String id=request.getParameter("id");
String pass=request.getParameter("pass");
String hp=request.getParameter("hp1")
+"-"+request.getParameter("hp2")
+"-"+request.getParameter("hp3");
String email=request.getParameter("eid")
+"@"+request.getParameter("mail");
String gaip=request.getParameter("gaip");



mymem.myDto dto=new mymem.myDto();
dto.setName(name);
dto.setId(id);
dto.setPass(pass);
dto.setHp(hp);
dto.setEmail(email);
dto.setGaip(gaip);

mymem.myDao dao=new mymem.myDao();
dao.insertMy(dto);

response.sendRedirect("mlist.jsp");
%>
</body>
</html>