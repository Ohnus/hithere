<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<h3>수정폼</h3>
<form action="/webApp2/Editmyinfo" method="post">
		<table border="1">
			<tr><th>ID</th><td><input type="text" name="id" value="${m.id }" readonly></td></tr>
			<tr><th>PWD</th><td><input type="text" name="pwd" value="${m.pwd }"></td></tr>
			<tr><th>NAME</th><td><input type="text" name="name" value="${m.name }"></td></tr>
			<tr><th>EMAIL</th><td><input type="text" name="email" value="${m.email }" readonly></td></tr>
			<tr><th>수정</th>
			<td><input type="submit" value="수정">
			<input type="button" value="취소" onclick="javascript:location.href='/webApp2/index.jsp'"></td></tr>
		</table>
	</form>
</body>
</html>