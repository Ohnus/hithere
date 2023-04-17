<!-- %@구문: jsp페이지에 대한 설정 -->
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script type="text/javascript">
function idcheck(){
	// open(param1, param2, param3) 새 윈도우 생성
	// param1 = 이 창에 띄울 메세지
	// param2 = 새 윈도우 이름
	// param3 = 설정(width가로 height세로 top수직위치 left수평위치)
	// 리턴값: 생성한 윈도우 객체
	let win = open('idcheck.jsp', 'win', 'width=300, height=400, top=100, left=600')
	// win.close(); 팝업창 닫음
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
			</td></tr>
			<tr><th>PWD</th><td><input type="password" name="pwd"></td></tr>
			<tr><th>NAME</th><td><input type="text" name="name"></td></tr>
			<tr><th>EMAIL</th><td><input type="text" name="email"></td></tr>
			<tr><th>가입</th><td><input type="submit" value="가입"></td></tr>
		</table>
	</form>
</body>
</html>