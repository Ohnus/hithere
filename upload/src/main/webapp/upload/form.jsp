<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<form action="${pageContext.request.contextPath }/test/upload" method="post" enctype="multipart/form-data">
		����:<input type="text" name="title"><br />
		����:<input type="file" name="file">
		<input type="submit" value="upload">
	</form>
</body>
</html>