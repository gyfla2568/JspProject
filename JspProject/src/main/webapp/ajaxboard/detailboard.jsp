<%@page import="java.text.SimpleDateFormat"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="ajaxbox.AjaxboardDto"%>
<%@page import="ajaxbox.AjaxBoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//num읽기
String num=request.getParameter("num");

//dao선언
AjaxBoardDao db=new AjaxBoardDao();

//num에 해당하는 dto얻기
AjaxboardDto dto=db.getData(num);

//dto를 json으로 변환
JSONObject ob=new JSONObject();
SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd hh:mm");

ob.put("num",dto.getNum());
ob.put("writer",dto.getWriter());
ob.put("subject",dto.getSubject());
ob.put("content",dto.getContent());
ob.put("avata",dto.getAvata());
ob.put("writeday",sdf.format(dto.getWriteday()));
%>
<%=ob.toString()%>