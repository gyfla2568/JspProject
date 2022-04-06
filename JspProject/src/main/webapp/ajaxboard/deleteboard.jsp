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

//* dao선언: delete만든거 호출하려고 */
AjaxBoardDao db=new AjaxBoardDao();

//NUM읽기
String num=request.getParameter("num");

//delete메서드 호출
db.deleteBoard(num);
%>
</body>
</html>