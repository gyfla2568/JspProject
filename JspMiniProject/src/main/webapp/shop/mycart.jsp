<%@page import="data.dao.MemberDao"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="javax.print.DocFlavor.STRING"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.List"%>
<%@page import="data.dao.ShopDao"%>
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
<style type="text/css">
img.photo{
	width: 70px;
	height: 80px;
	border: 2px solid gray;
}
div.sangpum{
	cursor: pointer;
}
span.del{
	cursor: pointer;
}
</style>
<script type="text/javascript">
$(function () {
	//전체 체크박스 선택, 해제
	$("#allcheck").click(function () {
		var a=$(this).is(":checked");
		if(a){
			$(".idx").attr("checked",true); //.prop속성도 됨
		}else{
			$(".idx").attr("checked",false);
		}
	});
	
	//상품클릭시 디테일 페이지로 이동
	$("div.sangpum").click(function(){
		//#num을 가져와서 디테일정보를 보여줄 수 있어야함
		var shopnum=$(this).attr("shopnum");
		
		location.href="index.jsp?main=shop/detailpage.jsp?shopnum="+shopnum;
		
	});
	//선택한 상품1개 삭제 이벤트
	$("span.del").click(function () {
		var idx=$(this).attr("idx");
		var a=confirm("삭제하려면 [확인]버튼을 클릭하세요");
		if(a){
			//alert(idx);
			//삭제 이벤트
			$.ajax({
				type:"get",
				url:"shop/cartdelete.jsp",
				dataType:"html",
				data:{"idx":idx},
				success:function(){
					//alert("삭제성공");
					
					location.reload(); //현재페이지 새로고침
				}
				
				
			});
		}
	});
	//체크한 후 삭제버튼으로 삭제이벤트
	$("#btncartdel").click(function(){
		
		//체크한 상품개수
		var cnt=$(".idx:checked").length;
		//alert(cnt);
		if(cnt==0){
			alert("먼저 선택할 상품을 선택하세요");
			return; //함수종료
		}
		$(".idx:checked").each(function(i,element){
			var idx=$(this).attr("idx");
			console.log(idx); //선택한 상품 idx만 나오는지 확인
			//선택한 장바구니 모두 삭제
			$.ajax({
				type:"get",
				url:"shop/cartdelete.jsp",
				dataType:"html",
				data:{"idx":idx},
				success:function(){
					alert("선택한 상품이 삭제되었습니다.");
					location.reload(); //현재페이지 새로고침
				}
				
				
			});
		});
	}
	});
	
	
});


</script>
</head>
<%
//로그인 한 아이디 얻기
	String id=(String)session.getAttribute("id");
	
	// dao선언
	MemberDao mdao=new MemberDao();
	String name=mdao.getName(id);
	ShopDao dao=new ShopDao();
	List<HashMap<String, String>> list=dao.getCartList(id);
	
	NumberFormat nf = NumberFormat.getInstance();
%>
<body>
<!-- 출력 -->
<h4 class="alert alert-warning" style="width: 1000px;">
<%=id %>님의 장바구니
</h4>
<table class="table table-striped" style="width:1000px;">
<tr>
	<th style="width: 30px;">
		<input type="checkbox" id="allcheck">
	</th>
	<th style="width: 300px;">상품정보</th>
	<th style="width: 200px;">상품금액</th>
</tr>
<%
int totalprice=0;
int totalcnt=0;

for(int i=0;i<list.size();i++) {
	HashMap<String, String> map=list.get(i);
	%>
	<tr>
		<td align="center">
			<input type="checkbox" name="idx" idx="<%=map.get("idx") %>" class="idx" checked="checked">
		</td>
		<td style="vertical-align: middle;">
			<div class="iteminfo" snum="<%=map.get("snum") %>">
			<img alt="" src="shopsave/<%=map.get("photo") %>" class="photo" align="left" hspace="20">
			<a href="index.jsp?main=shop/detailpage.jsp?snum=<%=map.get("snum") %>"><%=map.get("item") %></a>
			<br>수량: <%=map.get("cnt") %> / 추가일자: <%=map.get("cday") %>
			</div>
		</td>
		<td align="right" style="padding-right: 200px;">
			<%
				int itemprice=Integer.parseInt(map.get("price"));
				int itemcnt=Integer.parseInt(map.get("cnt"));
				totalprice+=itemprice*itemcnt;
				totalcnt+=itemcnt;
			%>	
			<%=nf.format(itemprice) %>원
			<br>
			<%=nf.format(itemprice*itemcnt) %>원
		</td>
		<td>
		<span class="glyphicon glyphicon-trash del" idx="<%=map.get("idx") %>"></span>

		</td>
	</tr>

<% }
%>
<tr>
	<td colspan="4" align="right">
	<button type="button" class="btn btn-danger btn-lg" style="margin-left: 100px;" id="btncartdel">선택상품 삭제</button>
	<br>
	<span>총 상품 개수: <%=totalcnt %>개</span><br>
	<span>총 주문 금액: <b><%=nf.format(totalprice) %>원</b></span>
</table>

</body>
</html>