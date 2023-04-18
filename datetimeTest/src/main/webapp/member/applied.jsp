<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
</script>
</head>
<body>
<h3>신청 회원 목록</h3>
<form action="${pageContext.request.contextPath }/update/status?id=${sessionScope.loginId}" method="post" name="f">
<table border="1">
<tr><th>아이디</th><th>이름</th><th>이메일</th><th>승인/미승인</th><th>확인버튼</th></tr>
<tr><td>${m.id}</td><td>${m.name }</td><td>${m.email }</td>
<td><select name="status">
	<option value="승인">승인</option>
	<option value="미승인">미승인</option>
</select></td>
<td><input type="submit" value="확인"></td></tr>
</table>
</form>
</body>
</html>