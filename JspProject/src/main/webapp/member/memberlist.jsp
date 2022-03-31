<%@page import="java.util.Vector"%>
<%@page import="member.MemberDao"%>
<%@page import="member.MemberDto"%>
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
body*{
	font-family: 'Dokdo';
	font-size: 13pt;
}

</style>
</head>
<body>
<%
	MemberDao dao=new MemberDao();
Vector<MemberDto>list=dao.getAllDatas();
%>
<b style="font-size: 10pt;">

<a href="form.html"><button type="button" class="btn btn-info">추가하기</button></a></b>

<hr>
<table class="table table-bordered" style="width: 600px;">
<caption><b>member목록</b></caption>
<tr>
	<th width="60">번호</th>
	<th width="80">이름</th>
	<th width="160">연락처</th>
	<th width="160">날짜</th>
	<th width="80">수정/삭제</th>
</tr>
<%
for(int i=0;i<list.size();i++)
{
	MemberDto dto=list.get(i);
	%>
	<tr>
	
		<td align="center"><%=i+1 %></td>
		<td><%=dto.getName() %></td>
		<td><%=dto.getHp() %></td>
		<td><%=dto.getSdate() %></td>
		<td>
			<button type="button" class="btn btn-info btn-xs" onclick="location.href='updateform.jsp?num=<%=dto.getNum() %>'">수정</button>
			<button type="button" class="btn btn-danger btn-xs" onclick="location.href='memberdelete.jsp?num=<%=dto.getNum() %>'">삭제</button>
		</td>
	</tr>
<%}

%>
</table>
</body>
</html>