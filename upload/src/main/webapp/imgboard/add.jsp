<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<h3>���ۼ�</h3>
<form action="${pageContext.request.contextPath }/imgboard/add" method="post" enctype="multipart/form-data">
<table border="1">
<tr><th>�ۼ���</th><td><input type="text" name="writer" value="${sessionScope.loginId }" readonly></td></tr>
<tr><th>����</th><td><input type="text" name="title"></td></tr>
<tr><th>�۳���</th><td><textarea rows="10" cols="30" name="content"></textarea></td></tr>
<tr><th>����</th><td><input type="file" name="file"></td></tr>
<tr><th>�ۼ�</th><td><input type="submit" value="����"></td></tr>
</table>
</form>
</body>
</html>