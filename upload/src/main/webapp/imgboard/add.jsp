<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<h3>글작성</h3>
<form action="${pageContext.request.contextPath }/imgboard/add" method="post" enctype="multipart/form-data">
<table border="1">
<tr><th>작성자</th><td><input type="text" name="writer" value="${sessionScope.loginId }" readonly></td></tr>
<tr><th>제목</th><td><input type="text" name="title"></td></tr>
<tr><th>글내용</th><td><textarea rows="10" cols="30" name="content"></textarea></td></tr>
<tr><th>사진</th><td><input type="file" name="file"></td></tr>
<tr><th>작성</th><td><input type="submit" value="저장"></td></tr>
</table>
</form>
</body>
</html>