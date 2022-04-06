<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="ajaxbox.AjaxboardDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="ajaxbox.AjaxBoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
AjaxBoardDao db=new AjaxBoardDao();
ArrayList<AjaxboardDto> list=db.getAllDatas();
SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd hh:mm");

//json생성
JSONArray arr=new JSONArray();
for(AjaxboardDto dto:list)
{
	JSONObject ob=new JSONObject();
	ob.put("num",dto.getNum());
	ob.put("writer",dto.getWriter());
	ob.put("subject",dto.getSubject());
	ob.put("content",dto.getContent());
	ob.put("avata",dto.getAvata());
	ob.put("writeday",sdf.format(dto.getWriteday()));
	
	arr.add(ob);
	
}
%>
<%=arr.toString()%>
