<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script type="text/javascript">
function a(){
	// �񵿱� ��û ��ü ����
	const xhttp = new XMLHttpRequest();
	
	// �񵿱� ��û ������ ���� �� �ڵ� ����� �ڵ鷯 ���
	xhttp.onload = function(){
// 		alert(xhttp.reponseText);
		let res = document.getElementById("res");
		res.innerHTML = xhttp.responseText; // responseText: �����κ��� ���� ���䰪
	}
	
	let param = "?name=" + f.name.value;
	// ��û ���۹��, ���������� url ����.. get����� ��� url�ڿ� �Ķ� ����
	xhttp.open("get", "${pageContext.request.contextPath}/ajaxtest/gettest" + param);
	xhttp.send();
	
}

function b(){
	// �񵿱� ��û ��ü ����
	const xhttp = new XMLHttpRequest();
	
	// �񵿱� ��û ������ ���� �� �ڵ� ����� �ڵ鷯 ���
	xhttp.onload = function(){
// 		alert(xhttp.reponseText);
		let res = document.getElementById("res");
		res.innerHTML = xhttp.responseText; // responseText: �����κ��� ���� ���䰪
	}
	
	let param = "name=" + f.name.value;
	// ��û ���۹��, ���������� url ����.. get����� ��� url�ڿ� �Ķ� ����
	xhttp.open("post", "${pageContext.request.contextPath}/ajaxtest/gettest");
	// post��� enctype�� application���� ����
	xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
	xhttp.send(param);
	
}
</script>
</head>
<body>
<form action="${pageContext.request.contextPath}/ajaxtest/gettest" name="f" method="get">
name: <input type="text" name="name"><br/>
<input type="button" value="ajax get ��û" onclick="a()">
<input type="button" value="ajax post ��û" onclick="b()">
<input type="submit" value="�����û">
</form>
<div id="res"></div>
</body>
</html>