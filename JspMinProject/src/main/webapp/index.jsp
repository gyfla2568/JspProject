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
div.layout{
border:0px solid gray;
position: absolute;
}
div.title{
	width: 100%;
	height: 100px;
	text-align:center;
}
div.menu{
	width: 100%;
	height: 80px;
	line-height: 80px;
	font-size: 30pt;
	font-family: 'Dokdo';
	text-align: center;
	top: 110px;
}
div.info{
	width: 200px;
	height: 200px;
	line-height: 10px;
	font-size: 15pt;
	font-family: 'Dokdo';
	top:300px;
	padding: 20px 10px;
	border: 5px groove pink;
	border-radius: 30px;
	left:20px;
}
div.main{
	width: 1200px;
	height: 700px;
	font-size: 13pt;
	font-family: 'Dokdo';
	left: 250px;
	top: 250px;
	
	
}
a,a:hover{
	text-decoration: none;
	color: black;
}

</style>
</head>
<%
//프로젝트 경로 구하기
String root=request.getContextPath();
//메인페이지는 레이아웃에 있는 메인이 기본페이지라는 것
String mainPage="layout/main.jsp";
//url을 통해서 main값을 읽어서 메인페이지에 출력한다
if(request.getParameter("main")!=null)
{
	mainPage=request.getParameter("main");
}
%>

<body>
<div class="layout title">
	<jsp:include page="layout/title.jsp"/>
</div>

<div class="layout menu">
	<jsp:include page="layout/menu.jsp"/>
</div>
<div class="layout info">
	<jsp:include page="layout/info.jsp"/>
</div>
<div class="layout main">
	<jsp:include page="<%=mainPage %>"/>
</div>

</body>
</html>