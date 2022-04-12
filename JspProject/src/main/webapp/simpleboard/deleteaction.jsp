<%@page import="java.io.File"%>
<%@page import="simpleboard.SimpleDao"%>
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
//num,pass
String num=request.getParameter("num");
String pass=request.getParameter("pass");

SimpleDao db=new SimpleDao();
boolean b=db.isEqualPass(num, pass);

//b가 참이면 삭제 후 이동
if(b)
{
	//게시글 지우기 전에 업로드 이미지 지우기
	String imgName=db.getData(num).getImgname();
	//업로드된 경로 구하기
	String uploadPath=getServletContext().getRealPath("/photo");
	
	//파일 생성
	File file=new File(uploadPath+"\\"+imgName);
	
	//파일 삭제
	if(file.exists()) //파일존재하면 
		file.delete();	//삭제
	db.deleteBoard(num); //삭제
	
	//리스트로 이동
	response.sendRedirect("boardlist.jsp");
	
}else{%>
	<script type="text/javascript">
	alert("비밀번호가 맞지 않아요");
	history.back();
	</script>
<%}

%>
</body>
</html>