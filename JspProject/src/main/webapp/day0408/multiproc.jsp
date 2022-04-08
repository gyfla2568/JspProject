<%@page import="java.util.Enumeration"%>
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
MultipartRequest multi=null;

//톰캣에 업로드된 프로젝트 경로
ServletContext context=getServletContext();

//프로젝트의 업로드된 실제경로
String realFolder=context.getRealPath("/upload");
System.out.println(realFolder);

//허용할 크기
int uploadSize=1024*1024*3; //3mb

try{
multi=new MultipartRequest(request,realFolder,uploadSize,"utf-8",
		new DefaultFileRenamePolicy());
//입력한 값들 읽어오기
String writer=multi.getParameter("writer");
%>

<h2>작성자: <%=writer %></h2>
<%
//파일타입이 여러개인 경우
Enumeration formNames=multi.getFileNames(); //file타입만 얻어옴
while(formNames.hasMoreElements())
{
	//파일태그에서 name 얻기
	String fileName=(String)formNames.nextElement();
	System.out.println("fileType name: "+fileName); //확인
	
	//실제 업로드된 파일명 얻기
	String uploadFileName=multi.getFilesystemName(fileName);
	
	//파일 선택안했을경우 null값
	if(uploadFileName!=null){%>
		
		<img alt="" src="../upload/<%=uploadFileName%>" style="max-width:200px;" border="1">
		<b><%=uploadFileName%></b>
	<%}	
}

%>


<%}catch(Exception e){
	
}


%>
</body>
</html>