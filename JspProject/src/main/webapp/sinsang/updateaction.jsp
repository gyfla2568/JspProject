<%@page import="sinsang.SinsangDao"%>
<%@page import="sinsang.SinsangDto"%>
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
String blood=request.getParameter("blood");
String birth=request.getParameter("birth");
String hp=request.getParameter("hp1")+"-"
		+request.getParameter("hp2")+"-"
		+request.getParameter("hp3");

//dto에 넣어주기
SinsangDto dto=new SinsangDto();

dto.setNum(num);
dto.setName(name);
dto.setBlood(blood);
dto.setHp(hp);
dto.setBirth(birth);

//dao선언
SinsangDao db=new SinsangDao();
db.updateSinsang(dto);

//insert호출 한번에 dto값을 넘겨준다
response.sendRedirect("sslist.jsp");

%>
</body>
</html>