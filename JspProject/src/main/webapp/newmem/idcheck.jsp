<%@page import="newmem.NewmemDao"%>
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
String key=request.getParameter("key"); /* 처음 호출시 null값 오류나는 것 방지 */
if(key==null){
	//null값일 경우 폼을 나타내고 액션처리한다
	%>
	
	<div style="margin: 10px 30px;">
	<form action="idcheck.jsp" method="post" class="form-inline">
		<b>아이디를 입력해주세요</b><br>
		<input type="text" name="mid" class="form-control input-sm"
		style="width: 130px; float: left;" required="required" placeholder="아이디입력">
		
		<!-- key값을 히든으로 넘긴다 -->
		<input type="hidden" name="key" value="yes">
		
		<button type="submit" class="btn btn-success btn-sm"
		style="margin-left:10;">중복체크</button>
	</form>
	</div>
<%}else{
	//action을 처리
	String mid=request.getParameter("mid");
	//dto선언 후 아이디가 db에 존재하는지 확인
	NewmemDao dao=new NewmemDao();
	boolean b=dao.isIdCheck(mid);
	if(b){
		//존재하는 경우
		%>
		<div style="margin:10px 30px;">
			<h5><%=mid %>는 이미 가입된 아이디입니다</h5>
			<img alt="" src="../img/2.png" width="60" align="left">
			<button type="button" class="btn btn-danger btn-sm"
			onclick="location.href='idcheck.jsp'">다시입력</button>
		</div>
	<%}else{
		//존재하지 않는경우
		%>
		<div style="margin:10px 30px;">
			<h5><%=mid %>는 사용가능한 아이디입니다</h5>
			<img alt="" src="../img/3.png" width="60" align="left">
			<button type="button" class="btn btn-danger btn-sm"
			onclick="saveId('<%=mid%>')">적용하기</button>
			<button type="button" class="btn btn-danger btn-sm"
			onclick="location.href='idcheck.jsp'">다시입력</button>
		</div>
		
	<% }
	
}
%>
<script type="text/javascript">
function saveId(id) {
	//alert(id);
	//부모창: opener
	opener.mfrm.mid.value=id;
	//현재창 닫기
	window.close();
}

</script>

</body>
</html>