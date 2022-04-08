<%@page import="mymem.myDto"%>
<%@page import="mymem.myDao"%>
<%@page import="java.util.StringTokenizer"%>
<%@page import="sinsang.SinsangDto"%>
<%@page import="sinsang.SinsangDao"%>
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
<script type="text/javascript">

/* hp2에 줄 것 */
function goFocus(hp){
	if(hp.value.length==4)
		frm.hp3.focus();
	
}
</script>
</head>
<%
String num=request.getParameter("num");
myDao dao=new myDao();
myDto dto=dao.getData(num);
%>
<body>
<form action="mupdateaction.jsp" method="post" name="frm">
	<table class="table table-bordered" style="width:350px;">
		<caption><b>수정폼</b></caption>
			<tr >
				<th width="100" bgcolor="FFA07A">이름</th>
					<td>
						<input type="text" name="name" size="8"
						value="<%=dto.getName()%>">
					</td>
			</tr>
			<tr>
				<th width="100" bgcolor="FFA07A">아이디</th>
					<td>
						<input type="text" name="id" size="8"
						value="<%=dto.getId()%>">
					</td>
			</tr>
			
			<tr>
				<th width="100"  bgcolor="FFA07A">비밀번호</th>
					<td>
						<input type="text" name="pass" size="8"
						value="<%=dto.getPass()%>">
					</td>
			</tr>
			<tr>
			<%
			//-(하이픈)을 구분자로 분리 :앞뒤로 짜르게 해줌
			StringTokenizer st=new StringTokenizer(dto.getHp(),"-");
			
			String hp1=st.nextToken();
			String hp2=st.nextToken();
			String hp3=st.nextToken();
			
			%>

				<th bgcolor="FFA07A">핸드폰</th>
					<td>
						<select name="hp1">
							<%
							String []strhp={"010","017","019","02"};
							for(int i=0;i<strhp.length;i++)
							{
								if(hp1.equalsIgnoreCase(strhp[i]))
								{%>
									<option value="<%=strhp[i]%>"selected="selected"><%=strhp[i]%></option>
								<%}else
								{%>
								<option value="<%=strhp[i]%>"><%=strhp[i]%></option>
							<%}
							}
							%>
						</select>
						<b>-</b>
						<input type="text" name="hp2" size="3" 
						onkeyup="goFocus(this)" value="<%=hp2%>"> <!--여기에 goFocus를 줄 것 이다-->
						<b>-</b>
						<input type="text" name="hp3" size="3" value="<%=hp3%>">
					</td>
			</tr>
			<tr>
			<%
			//@을 구분자로 분리 :앞뒤로 짜르게 해줌
			StringTokenizer st1=new StringTokenizer(dto.getEmail(),"@");
			
			String eid=st1.nextToken();
			String mail=st1.nextToken();
			
			%>
				<th bgcolor="FFA07A">이메일</th>
					<td>
						<input type="text" name="eid" size="3" value="<%=eid%>">
						<b>@</b>
						<select name="mail" >
							<%
							String []str={"gmail.com","naver.com","daum.net"};
							for(int i=0; i<str.length;i++)
							{
								if(mail.equalsIgnoreCase(str[i]))
								{%>
									<option value="<%=str[i]%>" selected="selected"><%=str[i]%></option>
								<%}else
								{%>
									<option value="<%=str[i]%>"><%=str[i] %></option>
								<%}
							}
							%>
						</select>
					</td>
			</tr>
			
			
			<tr>
				<th bgcolor="FFA07A">생년월일</th>
				<td>
					<input type="date" name="gaip" value="<%=dto.getGaip()%>">
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
				<input type="hidden" name="num" value="<%=dto.getNum() %>">
					<input type="submit" class="btn btn-success" value="db저장">
					<input type="hidden" name="num" id="num">
					<input type="button" class="btn btn-danger btn-xs" value="목록" onclick="location.href='mlist.jsp'">
				
				</td>
			</tr>
			
	</table>

</form>
</body>
</html>