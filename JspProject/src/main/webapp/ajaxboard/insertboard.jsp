<%@page import="ajaxbox.AjaxBoardDao"%>
<%@page import="ajaxbox.AjaxboardDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
<%
//post방식
request.setCharacterEncoding("utf-8");
String writer=request.getParameter("writer");
String subject=request.getParameter("subject");
String content=request.getParameter("content");
String avata=request.getParameter("avata");

//dto선언
AjaxboardDto dto=new AjaxboardDto();
dto.setWriter(writer);
dto.setSubject(subject);
dto.setContent(content);
dto.setAvata(avata);

//insert메서드 호출
AjaxBoardDao db=new AjaxBoardDao();
db.insertBoard(dto);

%>
</body>
</html>