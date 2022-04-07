<%@page import="ajaxbox.AjaxBoardDao"%>
<%@page import="ajaxbox.AjaxboardDto"%>
<%@page import="memo.MemoDto"%>
<%@page import="memo.MemoDao"%>

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
//엔코딩
request.setCharacterEncoding("utf-8");

//num,writer,content,avatar
String num=request.getParameter("unum");
String writer=request.getParameter("uwriter");
String subject=request.getParameter("usubject");
String content=request.getParameter("ucontent");
String avata=request.getParameter("uavata");

//dto에 넣어주기
AjaxboardDto dto=new AjaxboardDto();

dto.setNum(num);
dto.setWriter(writer);
dto.setSubject(subject);
dto.setContent(content);
dto.setAvata(avata);

//dao선언
AjaxBoardDao dao=new AjaxBoardDao();

//insert호출 한번에 dto값을 넘겨준다
dao.updateBoard(dto);
%>

</body>
</html>