<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script type="text/javascript">
window.onload = function(){
// 비동기 요청 객체 생성
	const xhttp = new XMLHttpRequest();
	
	// 비동기 요청 응답이 왔을 때 자동 실행될 핸들러 등록
	xhttp.onload = function(){
		let txt = xhttp.responseText;
		alert(txt);
		let html = '';
		let arr = JSON.parse(txt);
		for(let obj of arr){
			html += "num:" + obj.num + "<br/>"
			html += "name:" + obj.name + "<br/>"
			html += "tel:" + obj.tel + "<br/>"
		}
		let res = document.getElementById("res");
		res.innerHTML = html; // responseText: 서버로부터 받은 응답값
	}
	
	// 요청 전송방식, 서버페이지 url 설정.. get방식인 경우 url뒤에 파람 붙임
	xhttp.open("get", "${pageContext.request.contextPath}/json/test1");
	xhttp.send();
}
</script>
</head>
<body>
<div id="res"></div>
</body>
</html>