<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script type="text/javascript">
	function a() {
		const xhttp = new XMLHttpRequest(); // 1. 비동기 요청 객체 생성

		// 2. 요청 설정 & 페이지에 있는 내용 요청
		xhttp.open("get", "${pageContext.request.contextPath}/Ajax/server1.jsp?name=" + f.name.value)
		// 3. 전송
		xhttp.send();
		
		xhttp.onload = function() {
			let val = xhttp.responseText; // 4. 받은 응답
			let html = '';
			html += val;
			let div = document.getElementById("res");
			div.innerHTML = html;
		}
		
	}
</script>
</head>
<body>
<form action="" name="f">
<input type="text" name="name">
<input type="button" value="ajax 요청" onclick="a()">
</form>
<div id="res"></div>
</body>
</html>