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
		xhttp.open("get", "${pageContext.request.contextPath}/Ajax/server2.jsp");
		// 3. 전송
		xhttp.send();
		
		xhttp.onload = function() {
			let val = xhttp.responseText;
			let obj = JSON.parse(val);
			alert(obj.name);
			alert(obj.num);
		}
	}
	function b() {
		const xhttp = new XMLHttpRequest(); // 1. 비동기 요청 객체 생성

		// 2. 요청 설정 & 페이지에 있는 내용 요청
		xhttp.open("get", "${pageContext.request.contextPath}/Ajax/server3.jsp");
		// 3. 전송
		xhttp.send();
		
		xhttp.onload = function() {
			let val = xhttp.responseText;
			let arr = JSON.parse(val);
			let html = '';
			for(let obj of arr){
				html += "name: " + obj.name + "////////// num: " + obj.num + "<br/>";
			}
			let div = document.getElementById("res");
			div.innerHTML = html;
		}
	}
</script>
</head>
<body>
<input type="button" value="ajax 요청" onclick="a()">
<input type="button" value="ajax 요청2" onclick="b()">
<div id="res"></div>
</body>
</html>