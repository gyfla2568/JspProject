<%@page import="newmem.NewmemDto"%>
<%@page import="newmem.NewmemDao"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
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
String realPath=getServletContext().getRealPath("/save");
int uploadSize=1024*1024*2;

MultipartRequest multi=null;
try{
multi=new MultipartRequest(request,realPath,uploadSize,"utf-8"
		,new DefaultFileRenamePolicy());

//dao선언
NewmemDao dao=new NewmemDao();
//dto선언
NewmemDto dto=new NewmemDto();

dto.setNum(multi.getParameter("num"));
dto.setName(multi.getParameter("name"));
dto.setHp(multi.getParameter("hp"));

String photo=multi.getFilesystemName("photo");

if(photo==null){
//사진선택 안한경우 기존사진값 그래도
	String p=dao.getData(dto.getNum()).getPhoto();
	dto.setPhoto(p); /* 기존값 그대로 */
}else{
	dto.setPhoto("../save/"+photo);

}
	
	//db호출
	dao.updateMember(dto);
	
	//성공 후 이동
	response.sendRedirect("list.jsp");
	
	System.out.println(realPath);
	
	}catch(Exception e){
		System.out.println("업로드 오류"+e.getMessage());
	}
%>
</body>
</html>