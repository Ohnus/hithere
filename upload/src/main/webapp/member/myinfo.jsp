<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<h3>${m.id }���� ����</h3>
<form action="${pageContext.request.contextPath }/member/myinfo" method="post">
id:<input type="text" value="${m.id }" name="id" readonly><br/>
pwd: <input type="text" value="${m.pwd }" name="pwd"><br/>
name: <input type="text" value="${m.name }" name="name"><br/>
email: <input type="text" value="${m.email }" name="email" readonly><br/>
<input type="submit" value="����">
<input type="button" value="����" onclick="a()">
<a href="${pageContext.request.contextPath }/member/result.jsp">������������</a>
</form>
</body>
</html>

