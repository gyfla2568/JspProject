<%@page import="data.dto.MemberDto"%>
<%@page import="data.dao.MemberDao"%>
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

MemberDto dto=new MemberDto();
String name=request.getParameter("name");
String id=request.getParameter("id");
String pass=request.getParameter("pass");
String hp=request.getParameter("hp");
String addr=request.getParameter("addr");
String email=request.getParameter("email1")+"@"+request.getParameter("email2");


dto.setName(name);
dto.setId(id);
dto.setPass(pass);
dto.setHp(hp);
dto.setAddr(addr);
dto.setEmail(email);
MemberDao dao=new MemberDao();
dao.insertMember(dto);

//gaipsuccess.jsp로 이동
response.sendRedirect("../index.jsp?main=member/gaipsuccess.jsp?id="+id);


%>
</body>
</html>