<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script type="text/javascript">
window.onload = function(){
// �񵿱� ��û ��ü ����
	const xhttp = new XMLHttpRequest();
	
	// �񵿱� ��û ������ ���� �� �ڵ� ����� �ڵ鷯 ���
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
		res.innerHTML = html; // responseText: �����κ��� ���� ���䰪
	}
	
	// ��û ���۹��, ���������� url ����.. get����� ��� url�ڿ� �Ķ� ����
	xhttp.open("get", "${pageContext.request.contextPath}/json/test1");
	xhttp.send();
}
</script>
</head>
<body>
<div id="res"></div>
</body>
</html>