<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script type="text/javascript">
	window.onload = function() {
		let arr = [ 'aaa', 'bbb', 'ccc' ];
		let obj = {
			"name" : "aaa",
			"num" : 1,
			"tel" : "111",
			"flag" : true
		};
		let html = "arr valuse<br/>";
		for (i = 0; i < arr.length; i++) {
			html += arr[i] + ", ";
		}
		html += "<br/>";

		html += "obj 속성들<br/>";
		html += "name:" + obj.name + "<br/>";
		html += "num:" + obj.num + "<br/>";
		html += "tel:" + obj.tel + "<br/>";
		html += "flag:" + obj.flag + "<br/>";
		let div = document.getElementById("res");
		res.innerHTML = html;
	}
</script>
</head>
<body>
	<div id="res"></div>
</body>
</html>