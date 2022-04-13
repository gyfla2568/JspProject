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
img.mainimg{
	width: 250px;
	height: 160px;
	border: 1px solid gray;
}
table.maintb{width: 700px;}
table.maintb tr{
	height: 200px;
}
img.mainimg:hover{
	cusor: pointer;
	width: 300px;
	height: 200px;
	border: 5px solid cyan;
}
</style>
</head>
<body>
<table class="maintb">
<%
int n=0;
for(int row=1;row<=3;row++)
{%>
	<tr>
	<%
	for(int col=1;col<=4;col++)
	{
		n++;
		%>
		<td>
			<img alt="" src="image/<%=n%>.png" class="mainimg">
		</td>
	<%}
	%>
</tr>	
<%}
%>
</table>
</body>
</html>