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
<style type="text/css">
div.box{

float:left;
width: 50px;
height: 50px;
border-radius:100px;
margin-right:10px;  
}

</style>
</head>
<body>
<%
request.setCharacterEncoding("utf-8");

String sang=request.getParameter("sang");
String [] scolor=request.getParameterValues("scolor");
String ssize=request.getParameter("ssize");
String chuga=request.getParameter("chuga");
%>
<h3>상품명: <%=sang %></h3>
<h3>상품색상: <br>
<%
	if(scolor==null){%>
	<b>선택한 색상 없음</b>
	<%}else{
		for(String s:scolor){%>
		<div style="background-color: <%=s%>" class="box"></div>
	<%}
	}
%>

 </h3><br><br>
 <h3>사이즈: <%=ssize %> </h3>
<h3>추가 상품: <%=chuga %></h3>


</body>
</html>