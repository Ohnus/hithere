<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<form action="${pageContext.request.contextPath }/diary/add" method="post" enctype="multipart/form-data">
<input type="hidden" name="writer" value="${sessionScope.loginId }">
<table border="1">
<tr><th>내용</th><td><textarea rows="10" cols="30" name="content"></textarea></td></tr>
<tr><th>사진</th>
<td>
<input type="file" name="pic1"><br/>
<input type="file" name="pic2"><br/>
<input type="file" name="pic3"><br/>
</td>
<tr><th>저장</th>
<td>
<input type="submit" value="작성">
</td></tr>
</table>
</form>
</body>
</html>