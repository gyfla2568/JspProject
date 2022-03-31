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
<!-- include:이동했다 돌아옴..예를 들어 방문횟수같은 것 만들 때 사용한다 
forward:이동했다 돌아오지 않는다
redirect: forward는 url주소가 안바뀌고, redirect는 주소가 바뀐다
forward는 request,response가 그대로 전달되고 redirect는 전달안됨-->

</head>
<body>
<h2>다른 폴더의 파일 include하기</h2>
<h4>3번 구구단 예제</h4>
	<jsp:include page="gugu_03.jsp"/>
	<hr>
<h4>5번 중첩배열 이미지</h4>
	<jsp:include page="imgArrayQuiz_05.jsp"/>
</body>
</html>