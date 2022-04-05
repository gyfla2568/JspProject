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
String content=request.getParameter("ucontent");
String avatar=request.getParameter("uavatar");

//dto에 넣어주기
MemoDto dto=new MemoDto();

dto.setNum(num);
dto.setWriter(writer);
dto.setContent(content);
dto.setAvatar(avatar);

//dao선언
MemoDao dao=new MemoDao();

//insert호출 한번에 dto값을 넘겨준다
dao.updateMemo(dto);
%>

</body>
</html>