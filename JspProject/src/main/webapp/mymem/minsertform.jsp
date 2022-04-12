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
<body>
<form action="minsertaction.jsp" method="post" name="frm">
	<table class="table table-bordered" style="width:350px;">
		<caption><b>입력폼</b></caption>
			<tr >
				<th width="100" bgcolor="#FA8072">회원명</th>
					<td>
						<input type="text" name="name" size="8"
						placeholder="회원명" required="required">
					</td>
			</tr>
			<tr>
				<th width="100" bgcolor="#FA8072">id</th>
					<td>
						<input type="text" name="id" size="8"
						placeholder="id" required="required">
					</td>
			</tr>
			<tr>
				<th width="100" bgcolor="#FA8072">pass</th>
					<td>
						<input type="text" name="pass" size="8"
						placeholder="pass" required="required">
					</td>
			</tr>
			<tr>
				<th bgcolor="#FA8072">연락처</th>
					<td>
						<select name="hp1">
							<option value=010">010</option>
							<option value=018">018</option>
							<option value=019">019</option>
							<option value=02">02</option>
						</select>
						<b>-</b>
						<input type="text" name="hp2" size="3" 
						onkeyup="goFocus(this)" required="required"> <!--여기에 goFocus를 줄 것 이다-->
						<b>-</b>
						<input type="text" name="hp3" size="3" required="required">
					</td>
			</tr>
			<tr>
				<th bgcolor="#FA8072">이메일</th>
					<td>
						<input type="text" name="eid" size="3" 
						 required="required">
						<b>@</b>
						<select name="mail">
							<option value="gmail.com">gmail.com</option>
							<option value="naver.com">naver.com</option>
							<option value="daum.net">daum.net</option>
						</select>
						</td>
			</tr>
			<tr>
				<th bgcolor="#FA8072">가입일</th>
					<td>
						<input type="date" name="gaip" required="required">
				
					</td>
			</tr>
			
			
			<tr>
				<td colspan="2" align="center">
					<input type="submit" class="btn btn-success" value="db저장">
					<input type="button" class="btn btn-danger" value="목록" onclick="location.href='mlist.jsp'">
				
				</td>
			</tr>
			
	</table>

</form>
</body>
</html>