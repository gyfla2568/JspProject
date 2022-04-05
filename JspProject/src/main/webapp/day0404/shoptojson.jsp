
<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="mysql.db.Dbconnect"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
Dbconnect db=new Dbconnect();
Connection conn=db.getConnection();
Statement stmt=null;
ResultSet rs=null;

String sql="select * from shop order by num";
try{
stmt=conn.createStatement();
rs=stmt.executeQuery(sql);

/* json배열 */
JSONArray arr=new JSONArray(); //JSONObject가 들어가는 배열
while(rs.next())
{
	String num=rs.getString("num");
	String sanpum=rs.getString("sanpum");
	String color=rs.getString("color");
	String price=rs.getString("price");
	String imagename=rs.getString("imagename");
	
	//json생성
	JSONObject ob=new JSONObject(); 
	//데이터를 put으로 넣기
	ob.put("num",num); //키값이 num
	ob.put("sanpum",sanpum);
	ob.put("color",color);
	ob.put("price",price);
	ob.put("imagename",imagename);
	
	//array에 추가
	arr.add(ob);
	
}%>
<%=arr.toString() %>
<%}catch(SQLException e){
	
}finally{
	db.dbClose(rs, stmt, conn);
	
	
}
%>