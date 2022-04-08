<%@page import="mymem.myDao"%>
<%@page import="sinsang.SinsangDao"%>
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
<!-- 비밀번호가 무조건 a1234면 삭제 -->
<%
String pass=request.getParameter("pass");
String num=request.getParameter("num");
myDao dao=new myDao();


//비밀번호 확인 후 맞으면 ssdelete.jsp로 이동
//틀리면 이전화면으로 이동
if(pass.equals("a1234")){
	//삭제시 필요한 num값도 전달해야 한다.
	dao.deleteMy(num);
	response.sendRedirect("mlist.jsp");
}else
{%>
	<script type="text/javascript">
	alert("비밀번호가 맞지 않습니다");
	history.back();
	</script>
<%}
%>
</body>
</html>