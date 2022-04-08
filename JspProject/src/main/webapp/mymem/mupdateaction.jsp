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
//엔코딩
request.setCharacterEncoding("utf-8");

//num,writer,content,avatar
String num=request.getParameter("num");
String name=request.getParameter("name");
String id=request.getParameter("id");
String pass=request.getParameter("pass");
String hp=request.getParameter("hp1")+"-"
		+request.getParameter("hp2")+"-"
		+request.getParameter("hp3");
String email=request.getParameter("eid")
+"@"+request.getParameter("mail");
String gaip=request.getParameter("gaip");
//dto에 넣어주기
myDto dto=new myDto();

dto.setNum(num);
dto.setName(name);
dto.setId(id);
dto.setPass(pass);
dto.setHp(hp);
dto.setEmail(email);
dto.setGaip(gaip);
//dao선언
myDao db=new myDao();
db.updateMy(dto);

//insert호출 한번에 dto값을 넘겨준다
response.sendRedirect("mlist.jsp");

%>
</body>
</html>