<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script type="text/javascript">
function a(){
	// 비동기 요청 객체 생성
	const xhttp = new XMLHttpRequest();
	
	// 비동기 요청 응답이 왔을 때 자동 실행될 핸들러 등록
	xhttp.onload = function(){
// 		alert(xhttp.reponseText);
		let res = document.getElementById("res");
		res.innerHTML = xhttp.responseText; // responseText: 서버로부터 받은 응답값
	}
	
	let param = "?name=" + f.name.value;
	// 요청 전송방식, 서버페이지 url 설정.. get방식인 경우 url뒤에 파람 붙임
	xhttp.open("get", "${pageContext.request.contextPath}/ajaxtest/gettest" + param);
	xhttp.send();
	
}

function b(){
	// 비동기 요청 객체 생성
	const xhttp = new XMLHttpRequest();
	
	// 비동기 요청 응답이 왔을 때 자동 실행될 핸들러 등록
	xhttp.onload = function(){
// 		alert(xhttp.reponseText);
		let res = document.getElementById("res");
		res.innerHTML = xhttp.responseText; // responseText: 서버로부터 받은 응답값
	}
	
	let param = "name=" + f.name.value;
	// 요청 전송방식, 서버페이지 url 설정.. get방식인 경우 url뒤에 파람 붙임
	xhttp.open("post", "${pageContext.request.contextPath}/ajaxtest/gettest");
	// post방식 enctype을 application으로 설정
	xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
	xhttp.send(param);
	
}
</script>
</head>
<body>
<form action="${pageContext.request.contextPath}/ajaxtest/gettest" name="f" method="get">
name: <input type="text" name="name"><br/>
<input type="button" value="ajax get 요청" onclick="a()">
<input type="button" value="ajax post 요청" onclick="b()">
<input type="submit" value="동기요청">
</form>
<div id="res"></div>
</body>
</html>