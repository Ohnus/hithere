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
<tr><th>�ۼ���</th><td><input type="text" value="${sessionScope.loginId }" name="writer" readonly></td></tr>
<tr><th>����</th><td><input type="text" name="title"></td></tr>
<tr><th>����</th><td><textarea rows="20" cols="30" name="content"></textarea></td></tr>
<tr><th>����</th><td><input type="file" name="file"></td></tr>
<tr>
<td colspan="2" align="right">
<input type="submit" value="�ۼ�">
<input type="button" value="���" onclick="javascript:location.href='${pageContext.request.contextPath }/imgboard/list'">
</td></tr>
</table>
</form>
</body>
</html>