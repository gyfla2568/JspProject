<%@page import="data.dto.CartDto"%>
<%@page import="data.dao.ShopDao"%>
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
<%-- <%
request.setCharacterEncoding("UTF-8");

//id를 읽는다
 String shopnum=request.getParameter("shopnum"); 
 String num=request.getParameter("num"); 
int cnt=Integer.parseInt(request.getParameter("cnt"));

CartDto dto=new CartDto();
dto.setShopnum(shopnum);
dto.setNum(num);
dto.setCnt(cnt);


//dao선언
ShopDao dao=new ShopDao();
dao.insertCart(dto);
%> --%>

<jsp:useBean id="dao" class="data.dao.ShopDao"/>
<jsp:useBean id="dto" class="data.dto.CartDto"/>
<jsp:setProperty property="*" name="dto"/>
<%
dao.insertCart(dto);
%>

</body>
</html>