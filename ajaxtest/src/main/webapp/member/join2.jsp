<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script type="text/javascript">
function idcheck(){
const xhttp = new XMLHttpRequest();
	
	xhttp.onload = function(){
		let val = xhttp.responseText;
// 		alert(val);
		let html = '<h5 style="color:';
		let obj = JSON.parse(val);
		if(obj.flag){ // obj.flag(key) = true or false
			html += 'blue">사용가능한 아이디</h5>';
		} else {
			html += 'red">사용 불가능한 아이디</h5>';
		}
		let res = document.getElementById("res");
		res.innerHTML = html;
	}
	
	let param = "?id=" + f.id.value;
	xhttp.open("get", "${pageContext.request.contextPath}/member/idcheckajax" + param);
	xhttp.send();
	
}

function c(){
	alert("가입에 성공하셨습니다.")
}

</script>
</head>
<body>
<h3>회원가입</h3>
	<form action="${ pageContext.request.contextPath }/member/join" method="post" name="f">
		<table border="1">
			<tr><th>ID</th>
			<td>
			<input type="text" name="id">
			<input type="button" value="ID 중복체크" onclick="idcheck()">
			<span id="res"></span>
			</td></tr>
			<tr><th>PWD</th><td><input type="password" name="pwd"></td></tr>
			<tr><th>NAME</th><td><input type="text" name="name"></td></tr>
			<tr><th>EMAIL</th><td><input type="text" name="email"></td></tr>
			<tr><th>가입</th><td><input type="submit" value="가입" onclick="c()"></td></tr>
		</table>
	</form>
</body>
</html>