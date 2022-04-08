<%@page import="mymem.myDao"%>
<%@page import="mymem.myDto"%>
<%@page import="java.util.Vector"%>

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
<%
myDao db=new myDao();
Vector<myDto>list=db.getAllDatas();
%>
<body>
<a href="minsertform.jsp"><button type="button" class="btn btn-success">데이터추가</button></a>
<hr>

<table class="table table-bordered" style="width: 500px;">
	<caption><b>신상정보</b></caption>
	<tr bgcolor="pink">
		<th width="50">No.</th>
		<th width="150">회원명</th>
		<th width="50">id</th>
		<th width="250">비밀번호</th>
		<th width="250">연락처</th>
		<th width="250">이메일</th>
		<th width="250">가입일</th>
		<th width="150">편집(수정/삭제)</th>
	</tr>
	<%
	for(int i=0;i<list.size();i++)
	{
		myDto dto=list.get(i);
		%>
		<tr>
			<td align="center"><%=i+1 %></td>
			<td><%=dto.getName() %></td>
			<td><%=dto.getId() %></td>
			<td><%=dto.getPass() %></td>
			<td><%=dto.getHp() %></td>
			<td><%=dto.getEmail() %></td>
			<td><%=dto.getGaip() %></td>
			
			<td align="center">
				<button type="button" class="btn btn-info btn-xs"
				onclick="location.href='mupdateform.jsp?num=<%=dto.getNum()%>'">수정</button>
			
				<button type="button" class="btn btn-danger btn-xs"
				onclick="location.href='mpassform.jsp?num=<%=dto.getNum()%>'">삭제</button>
			</td>
		</tr>
		
	<%}
	%>
</table>
</body>
</html>