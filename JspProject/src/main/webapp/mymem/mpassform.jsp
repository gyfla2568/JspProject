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
String num=request.getParameter("num");
%>
<body>
<form action="mpassaction.jsp" method="post">
	<table class="table table-bordered" style="width: 250px;">
		<tr>
			<td>
				<b>삭제시 필요한</br>
				비밀번호를 입력하세요</b>
				<br><br>
				<input type="password" name="pass" size="5"
				required="required">
				
				<!-- hidden num넘기기 -->
				<input type="hidden" name="num" value="<%=num%>">
				
				<input type="submit" value="확인">
				<input type="button" value="목록"
				onclick="locatin.href='mlist.jsp'">
			</td>
		</tr>
	</table>
</form>
</body>
</html>