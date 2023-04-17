<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script type="text/javascript">
window.onload = () => {
	let arr = ['aaa', 'bbb', 'ccc']; // 배열
	let obj = {"name":"aaaa", "num":1}; // 객체 
	let txt = '{"name":"bbbb", "num":2}' // 문자열
	let obj2 = JSON.parse(txt); // parsing: 구문분석
	
	for(let val of arr){
		document.write(val + "<br/>");
	}
	
	for(let key in obj){
		document.write(key + ": " + obj[key] + "<br/>");
	}

	for(let key in obj2){
		document.write(key + ": " + obj2[key] + "<br/>");
	}
	
	for(let key in txt){
		document.write(key + ": " + txt[key] + "<br/>");
	}
	
}

</script>
</head>
<body>

</body>
</html>