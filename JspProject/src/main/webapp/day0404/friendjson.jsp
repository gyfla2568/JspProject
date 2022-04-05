<%@page import="mysql.db.Dbconnect"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="java.sql.SQLException"%>
<%@page import="org.json.simple.JSONObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
Dbconnect db=new Dbconnect();
Connection conn=db.getConnection();
Statement stmt=null;
ResultSet rs=null;

String sql="select * from friend order by num";
try{
stmt=conn.createStatement();
rs=stmt.executeQuery(sql);

/* json배열 */
JSONArray arr=new JSONArray(); //JSONObject가 들어가는 배열
while(rs.next())
{
	String num=rs.getString("num");
	String name=rs.getString("name");
	String hp=rs.getString("hp");
	String addr=rs.getString("addr");
	String gaip=rs.getString("gaip");
	
	//json생성
	JSONObject ob=new JSONObject(); 
	//데이터를 put으로 넣기
	ob.put("num",num); //키값이 num
	ob.put("name",name);
	ob.put("hp",hp);
	ob.put("addr",addr);
	ob.put("gaip",gaip);
	
	//array에 추가
	arr.add(ob);
	
}%>
<%=arr.toString() %>
<%}catch(SQLException e){
	
}finally{
	db.dbClose(rs, stmt, conn);
	
	
}
%>