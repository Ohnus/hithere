<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script type="text/javascript">
	function a() {
		const xhttp = new XMLHttpRequest(); // 1. �񵿱� ��û ��ü ����

		// 2. ��û ���� & �������� �ִ� ���� ��û
		xhttp.open("get", "${pageContext.request.contextPath}/Ajax/server1.jsp?name=" + f.name.value)
		// 3. ����
		xhttp.send();
		
		xhttp.onload = function() {
			let val = xhttp.responseText; // 4. ���� ����
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
<input type="button" value="ajax ��û" onclick="a()">
</form>
<div id="res"></div>
</body>
</html>