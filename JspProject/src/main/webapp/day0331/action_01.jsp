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

String grade =request.getParameter("grade");
String[] lang =request.getParameterValues("lang");
String file =request.getParameter("file");
String semi =request.getParameter("semi");
String height =request.getParameter("height");
String weight =request.getParameter("weight");
String col =request.getParameter("col");
String naljja =request.getParameter("naljja");


%>
<h3>**신상정보**</h3>
학력:<b><%=grade %></b><br>
프로그램언어:<%=lang %><br>
<%
if(lang==null)
{%>
	<font color="blue">아무것도 못합니다~~<br></font>
<%}else
{
	for(int i=0;i<lang.length;i++)
	{%>
		&nbsp;&nbsp;&nbsp;<b><%=lang[i] %></b>
	<%}
}
%>
파일명:<b><%=file %></b><br>
쎄미 조:<%=semi %><br>
당신의 키:<%=height %><br>
당신의 몸무게:<%=weight %><br>
색상선택:<%=col %><br>
날짜 선택:<%=naljja %>


</body>
</html>