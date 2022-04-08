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
//세션으로부터 아이디저장 체크값,아이디를 얻는다
String saveok=(String)session.getAttribute("saveok");
String id=(String)session.getAttribute("idok");
%>
<body>
<form action="loginproc.jsp" method="post">
	<table class="table table-bordered" style="width: 250px;">
		<caption><b>세션로그인</b></caption>
			<tr height="30">
				<td colspan="2" style-"padding-left: 10px;">
				
				<%
				if(saveok==null)
				{%>
					<input type="checkbox" name="savechk">아이디저장
				<%}else //체크상태면?
				{%>
					<input type="checkbox" name="savechk" checked="checked">아이디저장
				<%}
				%>
				
				
					<b>보안로그인</b>
				</td>
			</tr>
			<tr height="30">
				<th width="80">아이디</th>
					<td>
					
					<!--아이디 저장해두기 -->
					<%
					if(saveok==null)
					{%>
						<input type="text" size="10" name="id"
						autofocus="autofocus" value="">
						
					<%}else//체크상태면? 아이디상태 유지해둬라
					{%>
							<input type="text" size="10" name="id"
						autofocus="autofocus" value="<%=id %>">
						
					<%}
					%>
					<!--아이디 저장해두기 끝-->
					
					</td>
			</tr>
			
			<tr height="30">
				<th width="80">비밀번호</th>
					<td>
						<input type="password" size="10" name="pass"
						 required="required" class="form=control">
						
					</td>
			</tr>
			<tr height="30">
				<td colspan="2" align="center">
					<input type="submit" value="로그인" class="btn btn-info">
					<input type="button" value="회원가입" onclick="" class="btn btn-danger">
				</td>
			</tr>
	</table>
</form>
</body>
</html>