<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@page import="simpleboard.SimpleDao"%>
<%@page import="simpleboard.SimpleDto"%>
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
SimpleDao db=new SimpleDao();
//List<SimpleDto> list=db.getAllDatas();

// 페이징처리에 필요한 변수
int totalCount; //총 글수
int totalPage; //총 페이지수
int startPage; //각 블럭의 시작페이지
int endPage; //각 블럭의 끝페이지
int start; //각 페이지의 시작 번호
int perPage=5; //한페이지당 보여질 5개 게시글 갯수
int perBlock=5; //12345다음 한블럭당 보여지는 페이지 갯수
int currentPage; //현재페이지 

int no;
//총갯수
totalCount=db.getTotalCount();

//현재 페이지번호 읽기(단 null일 경우는 1page로 설정)
if(request.getParameter("cuttentPage")==null)
	currentPage=1;
else
	currentPage=Integer.parseInt(request.getParameter("currentPage"));
//총 페이지 개수 구하기
totalPage=totalCount/perPage+(totalCount%perPage==0?0:1);

//각 블럭의 시작페이지 구하기
//예를 들어 현재페이지가 3인 경우 startpage:1, endpage:5
//현재페이지가 6인경우 start:6, end:10
startPage=(currentPage-1)/perBlock*perBlock+1;
endPage=startPage+perBlock-1;

//만약 총페이지가 8이면 2번째 블럭은 스타트6 엔드가 10
//이럴경우는 endpage를 8로 수정
if(endPage>totalPage)
	endPage=totalPage;

//각 페이지에서 불러올 시작번호
start=(currentPage-1)*perPage;

//각 페이지에서 필요한 게시글 가져오기
List<SimpleDto> list=db.getList(start, perPage);

//각 글앞에 붙일 시작번호 구하기
//총 글이 20개면? 1페이지 20 2페이지 15부터 출력해서 1씩 감소
no=totalCount-(currentPage-1)*perPage;


%>
<div class="container">
<div class="alert alert-info" style="width:800px;">
<%-- <b>총<%=list.size() %>개의 글이 있습니다</b> --%>
<b>총<%=totalCount %>개의 글들이 있습니다</b>
</div>
<br>
<table class="table table-bordered" style="width: 800px;">
	<caption><b>게시판 목록 출력</b>
		<button type="button" class="btn btn-success btn-sm"
		onclick="location.href='boardform.jsp'"
		style="margin-left: 600px;">글쓰기</button>
	</caption>
		<tr style="background-color: #ffdd33;">
			<th style="width: 70px;">번호</th>
			<th style="width: 400px;">제목</th>
			<th style="width: 300px;">작성자</th>
			<th style="width: 120px;">작성일</th>
			<th style="width: 70px;">조회</th>
		</tr>
		<%
		//출력할 날짜 형식
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
		
		for(SimpleDto dto:list)
		{
			
			%>
			<tr>
			<!--번호 1씩 줄어들게하기-->
			<td align="center"><%=no-- %></td>
			<!-- 제목..내용보기로 연결 -->
			<td>
				<a href="content.jsp?num=<%=dto.getNum()%>">
				<img alt="" src="../photo/<%=dto.getImgname()%>"
				style="width:30px; height: 30px;">
				<%=dto.getSubject() %></a>
			</td>
			<!-- 작성자 -->
			<td><%=dto.getWriter() %></td>
			<!-- 작성일 -->
			<td><%=sdf.format(dto.getWriteday()) %></td>
			<!-- 조회수 -->
			<td align="center"><%=dto.getReadcount() %></td>
			</tr>
		<%}
		%>
</table>
</div>
<!-- 페이징처리 -->
<div style="width: 500px; text-align: center;" class="container">
	<ul class="pagination">
		<%
		//이전
		if(startPage>1)
		{%>
			<li>
				<a href="boardlist.jsp?currentPage=<%=startPage-1%>">이전</a>
			</li>
		<%}
		
		for(int pp=startPage;pp<=endPage;pp++)
		{
			if(pp==currentPage)
			{%>
				<li class="active">
					<a href="boardlist.jsp?currentPage=<%=pp%>"><%=pp %></a>
				</li>
			<%}else{%>
				<li >
				<a href="boardlist.jsp?currentPage=<%=pp%>"><%=pp %></a>
			</li>
			<%}
		}
		//다음
		if(endPage<totalPage)
		{%>
			<li>
				<a href="boardlist.jsp?currentPage=<%=startPage+1%>">다음</a>
			</li>
		<%}
		%>
	</ul>

</div>

</body>
</html>